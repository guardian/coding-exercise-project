package pairing

import "testing"

func TestSimpleString(t *testing.T) {
	if SayHello() != "hello" {
		t.Error("couldn't get hello message")
	}
}
