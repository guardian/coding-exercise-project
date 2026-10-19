(ns pairing.core-test
  (:require [clojure.test :refer :all]
            [pairing.core :refer :all]))

(deftest greeting-test
  (testing "greeting addresses the name it is given"
    (is (= "Hello, world!" (greeting "world")))))
