package gameoflife

import gol.GameOfLife._
import org.scalatest.FlatSpec
import org.scalatest.matchers.ShouldMatchers

class TestSetup extends FlatSpec with ShouldMatchers {
  "setup" should "always pass" in {
    val l = 1 :: 2 :: Nil
    l.size should be (2)
  }
}
