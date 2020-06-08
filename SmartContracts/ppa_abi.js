var ppaABI = [
	{
		"inputs": [],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_timestamp",
				"type": "uint256"
			},
			{
				"internalType": "address",
				"name": "_producer",
				"type": "address"
			},
			{
				"internalType": "address",
				"name": "_consumer",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "_price",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "_priceValidityTime",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "_deteriorationPercent",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "_energySurplusLimit",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "_energySurplusDiscount",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "_energyDeficitLimit",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "_deposit",
				"type": "uint256"
			}
		],
		"name": "createNewPpa",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "indexPpa",
				"type": "uint256"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_ppaIndex",
				"type": "uint256"
			}
		],
		"name": "getPpa",
		"outputs": [
			{
				"internalType": "enum PPA.PpaState",
				"name": "ppaState",
				"type": "uint8"
			},
			{
				"internalType": "uint256",
				"name": "timestamp",
				"type": "uint256"
			},
			{
				"internalType": "address",
				"name": "producer",
				"type": "address"
			},
			{
				"internalType": "address",
				"name": "consumer",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "price",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "priceValidityTime",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "deteriorationPercent",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "energySurplusLimit",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "energySurplusDiscount",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "energyDeficitLimit",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "deposit",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_ppaIndex",
				"type": "uint256"
			}
		],
		"name": "ppaState",
		"outputs": [
			{
				"internalType": "enum PPA.PpaState",
				"name": "state",
				"type": "uint8"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_ppaIndex",
				"type": "uint256"
			}
		],
		"name": "signPpa",
		"outputs": [
			{
				"internalType": "enum PPA.PpaState",
				"name": "state",
				"type": "uint8"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	}
]