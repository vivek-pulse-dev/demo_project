

#### Documentation comments: Use /// for documentation comments on classes, properties, and methods. DartDoc parses these to generate documentation. Do not use C-style /* ... */ for documentation.




#### comment explains WHY, not WHAT
    class PriceCalculator {
        double calculateDiscount(double pdPrice, int piQuantity) {
        // Apply bulk discount: 10% off for 10+ items, 20% off for 50+ items
        // Business rule defined in JIRA-1234
        if (piQuantity >= 50) {
            return pdPrice * 0.20;
        } else if (piQuantity >= 10) {
            return pdPrice * 0.10;
        }
        return 0;
    }
}

#### comment explains complex logic
    double calculateShippingCost(double pdWeight, String psZone) {
    // Shipping zones are defined as:
    // A: Local (< 50km) - base rate
    // B: Regional (50-200km) - base rate * 1.5
    // C: National (> 200km) - base rate * 2.5
    // International zones use different calculation (see calculateInternationalShipping)
    
    final ldBaseRate = _getBaseRate(pdWeight);
    
    switch (psZone) {
        case 'A':
            return ldBaseRate;
        case 'B':
            return ldBaseRate * 1.5;
        case 'C':
            return ldBaseRate * 2.5;
        default:
            throw ArgumentError('Invalid zone: $psZone');
    }
    }



#### Dart Doc Comments
### Use /// for documentation comments:


    /// A service for managing user authentication.
    ///
    /// This service handles login, logout, and session management
    /// for the application.
    ///
    /// Example:
    /// ```dart
    /// final authService = AuthService();
    /// await authService.login(email: 'user@example.com', password: 'password');
    /// ```
    class AuthService {
    /// The current authenticated user, or null if not authenticated.
    User? get currentUser => _oCurrentUser;
    }