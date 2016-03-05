#include <iostream>

#include <impala_udf/udf-test-harness.h>
#include "my-hash-udf.h"

using namespace impala;
using namespace impala_udf;
using namespace std;

int main(int argc, char** argv) {
  bool passed = true;

  passed &= UdfTestHarness::ValidateUdf<IntVal, StringVal>(
      HASHUdf, StringVal("hello"), IntVal(40));
 passed &= UdfTestHarness::ValidateUdf<IntVal, StringVal>(
     HASHUdf, StringVal::null(), IntVal::null());
  cout << "Tests " << (passed ? "Passed." : "Failed.") << endl;
  return !passed;
}
