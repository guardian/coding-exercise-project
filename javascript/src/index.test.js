const { pairingTest } = require('.');

test('pairingTest returns true', () => {
    expect(pairingTest()).toBe(true);
});