const { pairingTest } = require('.');

test('a failing test', () => {
    expect(pairingTest()).toBe(true);
});