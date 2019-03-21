package pairing

import "testing"

func TestNothing(t *testing.T) {
  t.Skip("no implemented")
}

func TestSimpleString(t *testing.T) {
  if SayHello() != "hello" {
    t.Error("couldn't get hello message")
  }
}
