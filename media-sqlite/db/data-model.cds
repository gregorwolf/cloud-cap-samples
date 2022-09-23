using {
   cuid,
   managed
} from '@sap/cds/common';

namespace sap.capire.media;

entity Media : cuid, managed {

   @Core.MediaType                   : mediaType
   @Core.ContentDisposition.Filename : fileName
   content         : LargeBinary;

   @Core.IsMediaType                 : true
   mediaType       : String;
   @mandatory
   fileName        : String;
   applicationName : String;
}
