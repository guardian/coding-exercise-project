import unittest
import pairing_exercise


class TestPairingExercise(unittest.TestCase):
    def test_name(self):
        self.assertEqual(pairing_exercise.name, 'Pairing exercise')
