#include <gtest/gtest.h>
#include "../inc/TestClass.hpp"

struct TestClassUnitTest : public ::testing::Test {
  Adder AdderUnitTest;
};

TEST_F(TestClassUnitTest, getResultAdd) {
  int result = AdderUnitTest.add(1, 1);
  ASSERT_EQ(1, result);
}
