(ns gol.core)

(defn greeting
  "Builds a greeting for the given name."
  [name]
  (str "Hello, " name "!"))

(defn -main
  [& args]
  (println (greeting "world")))
