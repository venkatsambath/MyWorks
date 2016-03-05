#include "my-hash-udf.h"
#include <cctype>
#include <cmath>
#include <string>


IntVal HASHUdf(FunctionContext* context, const StringVal& input) {

if (input.is_null) return IntVal::null();

        int index;
        int SIZE = 123;
        int sum = 0;
        uint8_t *ptr;

        for (ptr = input.ptr,index = 0; index < input.len; index++,ptr++)
            sum = sum + int(*ptr);
        return IntVal(sum % SIZE);

}


