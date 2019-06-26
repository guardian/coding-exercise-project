package gu.com

import org.scalatest.{FlatSpec, Matchers}

class MainTest extends FlatSpec with Matchers {
  "whereWeLive" should "be Earth" in {
    Main.whereWeLive should be ("Earth")
  }
}
