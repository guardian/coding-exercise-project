package gu.com

import org.scalatest.flatspec.{AnyFlatSpec}
import org.scalatest.matchers.should.{Matchers}

class MainTest extends AnyFlatSpec with Matchers {
  "whereWeLive" should "be Earth" in {
    Main.whereWeLive should be ("Earth")
  }
}
