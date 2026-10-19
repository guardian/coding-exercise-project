import { assertEquals } from "jsr:@std/assert";
import { result } from "./mod.ts";

Deno.test("Pairing test", () => {
  assertEquals(result, true);
});
