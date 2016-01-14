package gu.com

import org.scalatest.{FlatSpec, Matchers}

class TestSetup extends FlatSpec with Matchers {
  "setup" should "always pass" in {
    val l = List(1, 2)
    l.size should be (2)
  }
}
