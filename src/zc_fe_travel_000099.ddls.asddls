@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forTravel'
@ObjectModel.semanticKey: [ 'TravelID' ]
@Search.searchable: true
define root view entity ZC_FE_TRAVEL_000099
  as projection on ZI_FE_TRAVEL_000099
{
  key TravelUUID,

      @EndUserText.label: 'Travel'
      @ObjectModel.text.element:  [ 'Description' ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      TravelID,

      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: '/DMO/I_Agency',
          element: 'AgencyID'
        }
      } ]
      @EndUserText.label: 'Agency'
      @ObjectModel.text.element: ['AgencyName']
      AgencyID,
      _Agency.Name                   as AgencyName,

      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: '/DMO/I_Customer',
          element: 'CustomerID'
        }
      } ]
      @EndUserText.label: 'Customer'
      @ObjectModel.text.element: ['LastName']
      CustomerID,
      _Customer.LastName             as LastName,

      BeginDate,
      EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: 'I_Currency',
          element: 'Currency'
        }
      } ]
      CurrencyCode,

      Description,

      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: 'ZI_FE_STAT_000099',
          element: 'TravelStatusId'
        }
      } ]
      @EndUserText.label: 'Status'
      @ObjectModel.text.element: ['TravelStatusText']
      OverallStatus,
      _TravelStatus.TravelStatusText as TravelStatusText,

      OverallStatusCriticality,
      
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      @EndUserText.label: 'Last Changed At'
      LocalLastChangedAt,

      _Booking : redirected to composition child ZC_FE_BOOKING_000099,

      _Agency,
      _Currency,
      _Customer,
      _TravelStatus

}
