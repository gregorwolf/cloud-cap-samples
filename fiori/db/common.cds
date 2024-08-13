namespace sap.capire.bookshop;

using {sap.capire.bookshop} from '@capire/bookstore/srv/mashup';

entity GenreHierarchy : bookshop.Genres {
  hierarchyLevel          : Integer default 0;
  drillState              : String default 'leaf';
  parent                  : Association to GenreHierarchy;
  children                : Composition of many GenreHierarchy
                              on children.parent = $self;
  _LimitedDescendantCount : Integer64 @Core.Computed;
  _DistanceFromRoot       : Integer64 @Core.Computed;
  _Matched                : Boolean   @Core.Computed;
  _MatchedDescendantCount : Integer64 @Core.Computed;
}

extend service CatalogService with {
  @readonly
  entity GenreHierarchy as projection on bookshop.GenreHierarchy;
}
