/**
Copyright 2012 the Generic SIMD Intrinsic Library project authors. All rights reserved.

Copyright IBM Corp. 2013, 2013. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

* Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
     copyright notice, this list of conditions and the following
     disclaimer in the documentation and/or other materials provided
     with the distribution.
     * Neither the name of IBM Corp. nor the names of its contributors may be
     used to endorse or promote products derived from this software
     without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#include <getopt.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdio.h>
#include <algorithm>
#include <time.h>
#include <inttypes.h>
/*
  g++ -I../../include mandelbrot.cc -mvsx -flax-vector-conversions -Wno-int-to-pointer-cast -O3 -o mandelbrot
 */

 /* 
                Scalar version of mandelbrot 
 */
static long long mandel(double c_re, double c_im, long long count) {
  double z_re = c_re, z_im = c_im;
  long long cci=0;
  for (cci = 0; cci < count; ++cci) {
    if (z_re * z_re + z_im * z_im > 4.f)
      break;

    double new_re = z_re*z_re - z_im*z_im;
    double new_im = 2.f * z_re * z_im;
    z_re = c_re + new_re;
    z_im = c_im + new_im;
  }
  return cci;
 }

void mandelbrot_serial(double x0, double y0, double x1, double y1,
                       long long width, long long height, long long maxIterations,
                       long long output[])
{
  double dx = (x1 - x0) / width;
  double dy = (y1 - y0) / height;

  for (long long j = 0; j < height; j++) {
    for (long long i = 0; i < width; ++i) {
      double x = x0 + i * dx;
      double y = y0 + j * dy;

      long long index = (j * width + i);
      output[index] = mandel(x, y, maxIterations);
    }
  }
}

/* Write a PPM image file with the image of the Mandelbrot set */
static void
writePPM(long long *buf, long long width, long long height, const char *fn) {
  FILE *fp = fopen(fn, "wb");
  fprintf(fp, "P6\n");
  fprintf(fp, "%d %d\n", width, height);
  fprintf(fp, "255\n");
  for (long long i = 0; i < width*height; ++i) {
    // Map the iteration count to colors by just alternating between
    // two greys.
    char c = (buf[i] & 0x1) ? 240 : 20;
    for (long long j = 0; j < 3; ++j)
      fputc(c, fp);
  }
  fclose(fp);
  printf("Wrote image file %s\n", fn);
}


static void
writePPM_d(long long *buf, long long width, long long height, const char *fn) {
  for (long long i = 0; i < width; ++i) {
    for (long long j = 0; j < height; ++j) {
      long long index = i*width+j;
      printf("%4d ", buf[index]); 
    }
    printf("\n");
  }
  printf("Wrote image file %s\n", fn);
}


int main() {
  unsigned long long width = 4096 * 4;
  unsigned long long height = 4096 * 4;

  double x0 = -2;
  double x1 = 1;
  double y0 = -1;
  double y1 = 1;

  long long maxIterations = 10;
  long long *buf = new long long[width*height];
  
  for (long long i = 0; i < 3; ++i) {
    mandelbrot_serial(x0, y0, x1, y1, width, height, maxIterations, buf);
  }
 // writePPM(buf, width, height, "mandelbrot-serial-dbl.ppm");
  printf("buf[%d] = %d\n", width, buf[width]);

  return 0;
}
