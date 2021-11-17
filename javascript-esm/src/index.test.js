import { pairingTest } from './index'

test('a failing test', () => {
    expect(pairingTest()).toBe(true);
});