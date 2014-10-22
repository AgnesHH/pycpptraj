#include <stdio.h>

enum Temperature { temp_low, temp_medium, temp_high  };

int main(int argc, char** argv)
{
    enum Temperature t = temp_high;

    printf("%d", t);
    return 0;
}
