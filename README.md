# Fellowship

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fellowship'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fellowship

## Usage

### Basic
```ruby
Fellowship::Fellowship.deep_copy(x) # => x
Fellowship::Fellowship.factorial(5) # => 120
Fellowship::Fellowship.prime?(83) # => true
Fellowship::Fellowship.int_digit(234678, 1)  # => 3
```

### Hash Sorting
```ruby
Fellowship::Fellowship.sort_hashes_by(array_of_hashes, *keys)
```

### Route Finding

```ruby
Fellowship::Fellowship.find_a_route(start_id, end_id, segments, endpoint1, endpoint2)
Fellowship::Fellowship.find_shortest_route(start_id, end_id, segments, endpoint1, endpoint2, distance)
```

`segments` is an array of hashes; `endpoint1`, `endpoint2`, and `distance` are keys in those hashes.

The first syntax is faster and is ideal for graphs without loops or graphs where all segments are of equal length

#### Examples

Finding a route with the fewest number of segments or steps:

```ruby
segments = [
  {id: 407, nw_end: 1008, se_end: 1034, distance: 0.0451090841605882},
  {id: 408, nw_end: 1010, se_end: 1051, distance: 0.28526714884356},
  {id: 409, nw_end: 1007, se_end: 1034, distance: 0.0337117138131401},
  {id: 410, nw_end: 1034, se_end: 1009, distance: 0.0651634067494387},
  {id: 411, nw_end: 1005, se_end: 1006, distance: 0.00927910855352394},
  {id: 412, nw_end: 1051, se_end: 1035, distance: 0.133084855652394},
  {id: 413, nw_end: 1002, se_end: 1035, distance: 1.27839209339889},
  {id: 414, nw_end: 1006, se_end: 1007, distance: 0.0125502145551738},
  {id: 415, nw_end: 1009, se_end: 1010, distance: 0.012853363285835},
  {id: 416, nw_end: 1035, se_end: 1031, distance: 0.735882208263929},
  {id: 418, nw_end: 1031, se_end: 1030, distance: 1.12586171627523},
  {id: 419, nw_end: 1050, se_end: 1015, distance: 0.0412667354025934},
  {id: 420, nw_end: 1015, se_end: 1021, distance: 0.0714369928872643},
  {id: 421, nw_end: 1021, se_end: 1023, distance: 0.176347122662142},
  {id: 422, nw_end: 1023, se_end: 1032, distance: 0.175818715988043},
  {id: 423, nw_end: 1023, se_end: 1026, distance: 0.087528672029317},
  {id: 424, nw_end: 1030, se_end: 1028, distance: 0.634790077513064},
  {id: 425, nw_end: 1028, se_end: 1050, distance: 0.311440698359342},
  {id: 426, nw_end: 1028, se_end: 1033, distance: 0.101534760031209},
  {id: 430, nw_end: 1003, se_end: 1002, distance: 0.116309923531378},
  {id: 431, nw_end: 1025, se_end: 1003, distance: 0.533810729538892},
  {id: 432, nw_end: 1029, se_end: 1032, distance: 0.023222712},
  {id: 433, nw_end: 1004, se_end: 1015, distance: 1.04990888024116},
  {id: 436, nw_end: 1004, se_end: 1012, distance: 0.108583019227206},
  {id: 437, nw_end: 1012, se_end: 1052, distance: 0.047289907},
  {id: 457, nw_end: 1070, se_end: 1095, distance: 11.6214987078938},
  {id: 458, nw_end: 1114, se_end: 1081, distance: 8.20314176659542},
  {id: 459, nw_end: 1081, se_end: 1082, distance: 12.8813919590166},
  {id: 460, nw_end: 1082, se_end: 1071, distance: 13.7702138943404},
  {id: 461, nw_end: 1071, se_end: 1083, distance: 10.3263252875694},
  {id: 462, nw_end: 1083, se_end: 1085, distance: 20.9073747305393},
  {id: 463, nw_end: 1085, se_end: 1047, distance: 9.28349400463438},
  {id: 464, nw_end: 1086, se_end: 1087, distance: 70.0664133754052},
  {id: 465, nw_end: 1046, se_end: 1071, distance: 14.8395759342706},
  {id: 466, nw_end: 1087, se_end: 1088, distance: 13.4108176074637},
  {id: 467, nw_end: 1088, se_end: 1089, distance: 8.50714924428603},
  {id: 468, nw_end: 1089, se_end: 1075, distance: 11.9067149349027},
  {id: 469, nw_end: 1064, se_end: 1081, distance: 4.20243376792587},
  {id: 470, nw_end: 1047, se_end: 1086, distance: 7.77735216342798},
  {id: 471, nw_end: 1095, se_end: 1096, distance: 8.99184860070038},
  {id: 472, nw_end: 1096, se_end: 1097, distance: 11.6214987078938},
  {id: 473, nw_end: 1068, se_end: 1070, distance: 25.3573178747273},
  {id: 474, nw_end: 1097, se_end: 1098, distance: 10.8183848988841},
  {id: 475, nw_end: 1098, se_end: 1099, distance: 10.5952644987299},
  {id: 476, nw_end: 1099, se_end: 1100, distance: 18.6504162723198},
  {id: 477, nw_end: 1100, se_end: 1101, distance: 10.5344562782683},
  {id: 478, nw_end: 1102, se_end: 1069, distance: 15.9602569235506},
  {id: 479, nw_end: 1017, se_end: 1011, distance: 16.9370044102313},
  {id: 480, nw_end: 1079, se_end: 1093, distance: 41.4264760326217},
  {id: 481, nw_end: 1080, se_end: 1090, distance: 7.1291229632752},
  {id: 482, nw_end: 1080, se_end: 1079, distance: 7.05553097923426},
  {id: 483, nw_end: 1068, se_end: 1055, distance: 14.8564042223522},
  {id: 484, nw_end: 1055, se_end: 1056, distance: 10.1549592290523},
  {id: 485, nw_end: 1056, se_end: 1057, distance: 5.12111325727507},
  {id: 427, nw_end: 1066, se_end: 1039, distance: 19.3930411292224},
  {id: 428, nw_end: 1039, se_end: 1043, distance: 26.1784711360986},
  {id: 429, nw_end: 1074, se_end: 1093, distance: 8.58285100334328},
  {id: 434, nw_end: 1073, se_end: 1076, distance: 5.93055368559559},
  {id: 435, nw_end: 1073, se_end: 1068, distance: 26.7415940754477},
  {id: 438, nw_end: 1093, se_end: 1022, distance: 3.8477698},
  {id: 439, nw_end: 1092, se_end: 1093, distance: 7.6955396},
  {id: 440, nw_end: 1069, se_end: 1077, distance: 22.4299224757837},
  {id: 441, nw_end: 1043, se_end: 1078, distance: 39.9454087710314},
  {id: 443, nw_end: 1093, se_end: 1077, distance: 61.6791863036295},
  {id: 444, nw_end: 1018, se_end: 1048, distance: 29.0811827310994},
  {id: 445, nw_end: 1048, se_end: 1066, distance: 7.46633331398889},
  {id: 446, nw_end: 1074, se_end: 1069, distance: 49.9020895344982},
  {id: 447, nw_end: 1049, se_end: 1072, distance: 30.0601321090231},
  {id: 448, nw_end: 1067, se_end: 1049, distance: 17.1188565471891},
  {id: 449, nw_end: 1072, se_end: 1046, distance: 45.5878513494496},
  {id: 450, nw_end: 1053, se_end: 1094, distance: 4.20243376792587},
  {id: 451, nw_end: 1094, se_end: 1092, distance: 1.75574271304472},
  {id: 452, nw_end: 1065, se_end: 1114, distance: 37.3019531251371},
  {id: 453, nw_end: 1090, se_end: 1115, distance: 16.6715332931735},
  {id: 454, nw_end: 1115, se_end: 1011, distance: 32.578470872611},
  {id: 456, nw_end: 1113, se_end: 1017, distance: 22.3989999419667},
  {id: 486, nw_end: 1057, se_end: 1058, distance: 6.38410276942025},
  {id: 487, nw_end: 1058, se_end: 1059, distance: 3.98740847200949},
  {id: 488, nw_end: 1059, se_end: 1060, distance: 24.6836288585802},
  {id: 489, nw_end: 1060, se_end: 1061, distance: 22.1255421595633},
  {id: 490, nw_end: 1061, se_end: 1062, distance: 6.97732444211168},
  {id: 491, nw_end: 1062, se_end: 1074, distance: 12.5162551635436},
  {id: 492, nw_end: 1101, se_end: 1102, distance: 21.6136610101975},
  {id: 493, nw_end: 1033, se_end: 1103, distance: 23.2370185711613},
  {id: 494, nw_end: 1103, se_end: 1104, distance: 6.65775221794366},
  {id: 495, nw_end: 1104, se_end: 1114, distance: 8.53679307443082},
  {id: 496, nw_end: 1114, se_end: 1105, distance: 2.64881612468246},
  {id: 497, nw_end: 1105, se_end: 1106, distance: 0.76955396},
  {id: 498, nw_end: 1106, se_end: 1107, distance: 3.46593160021922},
  {id: 499, nw_end: 1107, se_end: 1111, distance: 11.5723069612762},
  {id: 500, nw_end: 1111, se_end: 1112, distance: 17.69974108},
  {id: 501, nw_end: 1112, se_end: 1108, distance: 18.9463112119279},
  {id: 502, nw_end: 1108, se_end: 1109, distance: 6.97732444211168},
  {id: 503, nw_end: 1109, se_end: 1110, distance: 6.15643168},
  {id: 504, nw_end: 1110, se_end: 1018, distance: 8.83639194154377},
  {id: 505, nw_end: 1038, se_end: 1112, distance: 3.8477698},
  {id: 506, nw_end: 1045, se_end: 1111, distance: 3.19205138471012},
  {id: 417, nw_end: 1075, se_end: 1073, distance: 16.886886298079},
  {id: 442, nw_end: 1074, se_end: 1053, distance: 6.65775221794366},
  {id: 455, nw_end: 1022, se_end: 1113, distance: 9.27321379585551}
]

bag_end_id = 1008
orodruin_id = 1017

p Fellowship::Fellowship.find_a_route(bag_end_id, orodruin_id, segments, :nw_end, :se_end)  # => {:route=>[407, 410, 415, 408, 412, 416, 418, 424, 426, 493, 494, 495, 458, 459, 460, 461, 462, 463, 470, 464, 466, 467, 468, 417, 435, 483, 484, 485, 486, 487, 488, 489, 490, 491, 429, 438, 455, 456], :tail=>1017}
```

Finding the shortest route:

```ruby
p Fellowship::Fellowship.find_shortest_route(bag_end_id, orodruin_id, segments, :nw_end, :se_end, :distance)  # => {:route=>[407, 410, 415, 408, 412, 416, 418, 424, 426, 493, 494, 495, 458, 459, 460, 461, 462, 463, 470, 464, 466, 467, 468, 417, 435, 483, 484, 485, 486, 487, 488, 489, 490, 491, 429, 438, 455, 456], :tail=>1017}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joshsarna/fellowship. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Fellowship project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/fellowship/blob/master/CODE_OF_CONDUCT.md).
