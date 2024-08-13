using {sap.capire.bookshop} from '../../db/common';

annotate bookshop.GenreHierarchy with @(
  Aggregation.RecursiveHierarchy #GenresHierarchy: {
    NodeProperty            : ID,
    ParentNavigationProperty: parent
  },
  Hierarchy.RecursiveHierarchy #GenresHierarchy  : {
    LimitedDescendantCount: _LimitedDescendantCount,
    DistanceFromRoot      : _DistanceFromRoot,
    DrillState            : drillState,
    Matched               : _Matched,
    MatchedDescendantCount: _MatchedDescendantCount
  },
  Capabilities.FilterRestrictions                : {NonFilterableProperties: [
    _LimitedDescendantCount,
    _DistanceFromRoot,
    drillState,
    _Matched,
    _MatchedDescendantCount
  ]},
  Capabilities.SortRestrictions                  : {NonSortableProperties: [
    _LimitedDescendantCount,
    _DistanceFromRoot,
    drillState,
    _Matched,
    _MatchedDescendantCount
  ]},
);
