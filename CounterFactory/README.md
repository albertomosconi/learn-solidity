Once deployed, [`CounterFactory`](CounterFactory.sol) allows an address to have his own [`Counter`](Counter.sol) contract by calling `createCounter`.

This same address can then increment his counter by interacting with the factory, with the `increment` method. This calls the contract's own method, which **can only be called by the factory**.
