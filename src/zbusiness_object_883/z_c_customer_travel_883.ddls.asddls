@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer - Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity Z_C_CUSTOMER_TRAVEL_883
  provider contract transactional_query
  as projection on Z_R_CUSTOMER_TRAVEL_883
{
  key CustomerUuid,
  
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH      
      //Realizar una proyección de textos del segundo nombre
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,  
      Description,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      
      /* Associations */      
      _Customer.LastName as CustomerName,
      
      //Traer nombre del pais y traducir al idioma del usuario
      //_Customer._Country._Text.CountryName as CountryName :localized
      _Customer._Country._Text[1: Language = $session.system_language].CountryName             as CustomerCountry,
      
      _Customer
      
}
