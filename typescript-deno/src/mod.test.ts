import { assertEquals } from "https://deno.land/std@0.153.0/testing/asserts.ts";
import { result } from "./mod.ts";

Deno.test("Pairing test", () => {
  assertEquals(result, true);
});
