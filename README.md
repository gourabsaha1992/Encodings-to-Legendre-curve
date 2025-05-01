The Magma codes verify the encoding and decoding maps of Elligator-L3, Elligator-L1, and Elligator-T.

CFC indicates the mapping from a curve point to a field element, and then back to the curve.

FCF indicates the mapping from a field element to the curve, and then back to the field.

Success: Starting from an arbitrary curve or field point, the composition of the encoding and decoding maps returns the same point.

Reject x: There is no curve point with this x-coordinate.

Reject y: There is no curve point with this y-coordinate.

Reject Encoding: The curve point cannot be encoded by the map.
