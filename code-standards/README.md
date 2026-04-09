# demo_project

DAO = Data Access Object


#### Global/Member variable (Private)
    int _totalCount = 0;
    enum Status { active, inactive }

    
    
    List<int> primes = [2,3,5,7];

    void sayHello(String name) {
    String fullMessage = "Hello $name";
        
    }

#### Local variable: firstName  
    String lsFirstName = "user";
    List<int> lstPrimes = [2,3,5,7];


### In UserListController these are global variables. 
    class UserListController extends GetxController {
    
         int abc = 10; //liAbc
    
    
        int _currentPage = 1;  // _miCurrentPage
        final int _limit = AppConstants.defaultPageSize; // _miLimit
    
        TextEditingController searchController = TextEditingController(); // _miSearchController
 
## fetchData(int pageNo, String searchQuery) {
        fetchData(int fiPageNo, String fsSearchQuery) {
            liCurrentPageNo = fiPageNo++;
        }


    }

#### SCREAMING_SNAKE_CASE
    All uppercase letters with words separated by underscores. Used for constant values.
    Example: MAX_RETRY_COUNT, API_BASE_URL

#### Variable Prefixes by Scope
    For enhanced code readability and scope identification, use the following prefixes:

    Prefix	Scope	                        Example
    _	    Private (class/library level)	_userName, _isLoading
    l	    Local variable (within method)	lUserName, lIsValid
    p	    Parameter (function argument)	pUserId, pCallback

    Type	        Prefix	    Example
    String	        s	        lsUserName, _sApiKey
    int	i	        l           iCount, _iMaxRetries
    double	        d	        ldPrice, _dTaxRate
    bool	        b	        lbIsActive, _bIsLoading
    List	        lst	        lstUsers, _lstProducts
    Map	            map	        mapUserData, _mapConfig
    Set	            set	        setUniqueIds, _setTags
    Object/Custom	o	        loUser, _oApiService
    Future	        fut	        futUserData, _futConfig
    Stream	        stm	        stmMessages, _stmUpdates

    

#### Boolean Variables: Prefix booleans with is, has, can, or should.
    Example: isFinished, hasError, canUpdate.

#### Asset Naming: Image and font resources should be in snake_case to match file naming conventions.
    Example: assets/images/red_tshirt.png

#### File naming: All files MUST use snake_case.dart.
    Good: product_list_screen.dart
    user_profile_screen.dart     → class UserProfileScreen
    api_service.dart             → class ApiService
    user_model.dart              → class UserModel
    auth_repository.dart         → class AuthRepository
    user_profile_screen_test.dart → tests for UserProfileScreen

#### Routing and Navigation Standards
    Example: static const String routeDetails = '/product-details';

#### State Management: If using Bloc, Provider, or Riverpod, follow standard file suffixing:
    Bloc: product_bloc.dart, product_event.dart, product_state.dart
    Controller (GetX/Riverpod): auth_controller.dart (Class: AuthController)
    ViewModel (MVVM): home_view_model.dart (Class: HomeViewModel)

#### Use const Constructors Everywhere

#### // Good - using theme
    class CustomCard extends StatelessWidget {
    final String title;
    final String subtitle;
    
    const CustomCard({Key? key,required this.title,required this.subtitle}) : super(key: key);
    
    @override
    Widget build(BuildContext context) {
        final loTheme = Theme.of(context);
        final loTextTheme = loTheme.textTheme;
    
        return Container();
    }



##### enum

# Even better - enum with values (Dart 2.17+)
    enum PaymentStatus {
        pending('Pending', Colors.orange),
        processing('Processing', Colors.blue),
        completed('Completed', Colors.green),
        failed('Failed', Colors.red),
        refunded('Refunded', Colors.grey);
        
        final String label;
        final Color color;
        
        const PaymentStatus(this.label, this.color);
    }

    enum PaymentMethod {    /// in camelCase naming
        creditCard,
        debitCard,
        bankTransfer,
        digitalWallet,
    }
