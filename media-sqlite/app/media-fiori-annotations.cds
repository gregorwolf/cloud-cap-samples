using sap.capire.media as media from '../db/data-model';

annotate media.Media with @(UI : {
  Identification      : [{Value : fileName}],
  SelectionFields     : [fileName, ],
  LineItem            : [
    {Value : fileName},
    {Value : content},
  ],
  HeaderInfo          : {
    TypeName       : '{i18n>Document}',
    TypeNamePlural : '{i18n>Documents}',
    Title          : {Value : ID},
    Description    : {Value : fileName}
  },
  Facets              : [{
    $Type  : 'UI.ReferenceFacet',
    Label  : '{i18n>Details}',
    Target : '@UI.FieldGroup#Details'
  }],
  FieldGroup #Details : {Data : [
    {Value : fileName},
    {Value : content},
  ]},
});
