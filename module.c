#include "global.h"
#include "module.h"
#include <uuid/uuid.h>

void module_hello() {
	uuid_t uuid;
	char uuid_string[27] = {'\0'};

	printf("Hello from module!.\n");

	uuid_generate_random(uuid);
	uuid_unparse_lower(uuid, uuid_string);
	uuid_string[26] = '\0';

	printf("This is a random UUID: %s\n", uuid_string);
}
