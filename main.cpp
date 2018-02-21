extern "C"
{
#include "base/main/main.h"
}

int main( int argc, char* argv[] )
{
  Abc_Start();
  Abc_Print( Abc_VerbLevel::ABC_STANDARD, "test\n" );
  Abc_Stop();

  return 0;
}
