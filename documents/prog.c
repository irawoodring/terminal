#include <unistd.h>
#include <stdio.h>

int main(int argc, char** argv) {
    const char *path = "/tmp/test.txt";

    if (access(path, F_OK) == 0) {
        printf("File exists\n");
    } else {
        printf("File does not exist\n");
    }

    return 0;
}
