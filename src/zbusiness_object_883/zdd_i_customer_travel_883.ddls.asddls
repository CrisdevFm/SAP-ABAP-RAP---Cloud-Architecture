@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - Interface Entity '
// Si esta notacion esta en false o no se pone se heredan las anotaaciones de la entidad raiz @Metadata.ignorePropagatedAnnotations: true
define root view entity ZDD_I_CUSTOMER_TRAVEL_883
  provider contract transactional_interface
  as projection on Z_R_CUSTOMER_TRAVEL_883
{
  key CustomerUuid,
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
  _Customer
}
