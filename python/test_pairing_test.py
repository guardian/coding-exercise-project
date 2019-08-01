import unittest

import pairing_test


class TestPairingTest(unittest.TestCase):

    def test_unit_tests(self):
        self.assertTrue(False, 'You shall not pass!')

    def test_import(self):
        self.assertEqual(pairing_test.get_name(), 'Pairing Test')

