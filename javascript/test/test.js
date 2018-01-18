const { pairingTest } = require('../src/pairing-test');

test('a failing test', () => {
    expect(pairingTest()).toBe(true);
});