#ifndef __CRYPTOHASH_H
#define __CRYPTOHASH_H

#define SHA_DIGEST_WORDS 5
#define SHA_MESSAGE_BYTES (512 /*bits*/ / 8)
#define SHA_WORKSPACE_WORDS 16

#include <stdint.h>

void sha_init(uint32_t *buf);
void sha_transform(uint32_t *digest, const char *data, uint32_t *W);

#endif
