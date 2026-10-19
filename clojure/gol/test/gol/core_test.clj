(ns gol.core-test
  (:require [clojure.test :refer :all]
            [gol.core :refer :all]))

(deftest greeting-test
  (testing "greeting addresses the name it is given"
    (is (= "Hello, world!" (greeting "world")))))
