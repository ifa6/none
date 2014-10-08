#ifndef __NONE_BOOL_H__
#define __NONE_BOOL_H__

#ifndef __cplusplus

#define bool    _Bool
#define true    1
#define false   0
# else

#define _Bool  bool
#define false  false
#define true   true

#endif

#define __bool_true_false_are_defined 1

#endif
