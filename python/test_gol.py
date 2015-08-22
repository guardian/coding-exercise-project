import unittest

import gol

class TestGameOfLife(unittest.TestCase):
    def test_unit_tests(self):
        self.assertTrue(False, 'You shall not pass!')
    def test_import(self):
        self.assertEqual(gol.name, 'Game of Life')
