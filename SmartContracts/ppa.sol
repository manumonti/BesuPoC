// SPDX-License-Identifier: MIT

pragma solidity >=0.6.8 <0.7.0;

contract PPA {
    
    address immutable bettergyAccount;
    
    // States in which PPA can be: 
    // producer & consumer signature left, producer or consumer signature left, etc.
    enum PpaState { notSigned, producerSignLeft, consumerSignLeft, active, terminated }
    
    // PPA clauses
    struct Ppa {
        PpaState ppaState;                                      // Current state of the PPA
        uint timestamp;                                         // Timestamp of the creation of the PPA
        address producer;                                       // Producer account address
        address consumer;                                       // Consumer account address
        uint price;                                             // Price of energy in MWh/year (must be an unsigned int!)
        uint priceValidityTime;                                 // Validity time of agreed price in years
        uint deteriorationPercent;                              // Annual energy loss due to instalation deterioration in percent
        uint energySurplusLimit;                                // Energetic surplus from which energy is free for consumer in percent
        uint energySurplusDiscount;                             // Discount in the price of Energy when production is higher than 100% in percent
        uint energyDeficitLimit;                                // Energetic deficit from which producer must compensate to consumer in percent
        uint deposit;                                           // Economic deposit that consumer deliver to producer
    }
    
    // Database of PPAs
    Ppa[] private ppaDatabase;
    
    constructor() public {
        bettergyAccount = msg.sender;
    }
    
    // Add a new PPA to PPA Database.
    // return the array index of the PPA and emit an event.
    function createNewPpa ( 
            uint _timestamp, 
            address _producer, 
            address _consumer, 
            uint _price, 
            uint _priceValidityTime, 
            uint _deteriorationPercent, 
            uint _energySurplusLimit, 
            uint _energySurplusDiscount, 
            uint _energyDeficitLimit, 
            uint _deposit 
        ) public returns ( uint indexPpa ) {
            
        require ( msg.sender == bettergyAccount );
        
        Ppa memory newPpa = Ppa (
            PpaState.notSigned,
            _timestamp,
            _producer,
            _consumer,
            _price,
            _priceValidityTime, 
            _deteriorationPercent, 
            _energySurplusLimit, 
            _energySurplusDiscount, 
            _energyDeficitLimit, 
            _deposit
            );
        
        ppaDatabase.push (newPpa);
        
        return ( ppaDatabase.length-1 );
        
    }
    
    function getPpa ( uint _ppaIndex ) public view returns ( 
            PpaState ppaState,
            uint timestamp,
            address producer,
            address consumer,
            uint price,
            uint priceValidityTime,
            uint deteriorationPercent,
            uint energySurplusLimit,
            uint energySurplusDiscount,
            uint energyDeficitLimit,
            uint deposit
            ) {
        
        require ( _ppaIndex < ppaDatabase.length);
        require ( msg.sender == bettergyAccount || msg.sender == ppaDatabase[_ppaIndex].producer || msg.sender == ppaDatabase[_ppaIndex].consumer );
        
        ppaState                = ppaDatabase[_ppaIndex].ppaState;
        timestamp               = ppaDatabase[_ppaIndex].timestamp;
        producer                = ppaDatabase[_ppaIndex].producer;
        consumer                = ppaDatabase[_ppaIndex].consumer;
        price                   = ppaDatabase[_ppaIndex].price;
        priceValidityTime       = ppaDatabase[_ppaIndex].priceValidityTime;
        deteriorationPercent    = ppaDatabase[_ppaIndex].deteriorationPercent;
        energySurplusLimit      = ppaDatabase[_ppaIndex].energySurplusLimit;
        energySurplusDiscount   = ppaDatabase[_ppaIndex].energySurplusDiscount;
        energyDeficitLimit      = ppaDatabase[_ppaIndex].energyDeficitLimit;
        deposit                 = ppaDatabase[_ppaIndex].deposit;
    }
    
    // Returns current state of the PPA
    function ppaState ( uint _ppaIndex ) public view returns ( PpaState state ) {
        
        require ( _ppaIndex < ppaDatabase.length);
        require ( msg.sender == bettergyAccount || msg.sender == ppaDatabase[_ppaIndex].producer || msg.sender == ppaDatabase[_ppaIndex].consumer );
        return (ppaDatabase[_ppaIndex].ppaState);
    }

    // Function for signing the PPA. Must be called by producer and consumer
    // This function updates the state of the PPA
    function signPpa ( uint _ppaIndex ) public returns ( PpaState state ) {
        
        require ( _ppaIndex < ppaDatabase.length);
        require ( msg.sender == ppaDatabase[_ppaIndex].producer || msg.sender == ppaDatabase[_ppaIndex].consumer );
        
        if ( ppaDatabase[_ppaIndex].ppaState == PpaState.notSigned ) {
            if ( msg.sender == ppaDatabase[_ppaIndex].producer ) {
                ppaDatabase[_ppaIndex].ppaState = PpaState.consumerSignLeft;
            } else {
                ppaDatabase[_ppaIndex].ppaState = PpaState.producerSignLeft;
            }
        } else if ( ppaDatabase[_ppaIndex].ppaState == PpaState.consumerSignLeft && msg.sender == ppaDatabase[_ppaIndex].consumer ) {
            ppaDatabase[_ppaIndex].ppaState = PpaState.active;
        } else if ( ppaDatabase[_ppaIndex].ppaState == PpaState.producerSignLeft && msg.sender == ppaDatabase[_ppaIndex].producer ) {
            ppaDatabase[_ppaIndex].ppaState = PpaState.active;
        }
        
        return (ppaDatabase[_ppaIndex].ppaState);
    }
}