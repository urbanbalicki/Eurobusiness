#include <gtest/gtest.h>
#include "../inc/TestClass.hpp"

struct ComposingSquaredStringTest : public ::testing::Test {
  Adder AdderUnitTest;
};

TEST_F(ComposingSquaredStringTest, getResultFromCompose) {
  int result = AdderUnitTest.add(1, 1);
  ASSERT_EQ(1, result);
}
