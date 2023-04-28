namespace: BoltOrderCreation
operation:
  name: OrderCheck
  inputs:
    - orders:
        required: false
  python_action:
    use_jython: false
    script: "def execute(orders):\n    \n    if orders != \"\":\n        if \",\" not in orders and \" \" in orders:\n            orders = orders.replace(\" \",\",\")\n        if orders.endswith(\",\"):\n            orders = orders[:-1]\n        boltOrders = orders\n    else:\n        boltOrders = \"\"\n        \n    return{\"boltOrders\":boltOrders}"
  outputs:
    - boltOrders
  results:
    - SUCCESS
