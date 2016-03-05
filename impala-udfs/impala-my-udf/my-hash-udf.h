#ifndef SAMPLES_UDF_H
#define SAMPLES_UDF_H

#include <impala_udf/udf.h>

using namespace impala_udf;

IntVal HASHUdf(FunctionContext* context, const StringVal& input);

#endif

