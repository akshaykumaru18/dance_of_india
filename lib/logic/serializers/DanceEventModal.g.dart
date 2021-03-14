// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DanceEventModal.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DanceEventModal> _$danceEventModalSerializer =
    new _$DanceEventModalSerializer();

class _$DanceEventModalSerializer
    implements StructuredSerializer<DanceEventModal> {
  @override
  final Iterable<Type> types = const [DanceEventModal, _$DanceEventModal];
  @override
  final String wireName = 'DanceEventModal';

  @override
  Iterable<Object> serialize(Serializers serializers, DanceEventModal object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date,
          specifiedType: const FullType(DateTime)),
      'posterImg',
      serializers.serialize(object.posterImg,
          specifiedType: const FullType(String)),
      'venue',
      serializers.serialize(object.venue,
          specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'city',
      serializers.serialize(object.city, specifiedType: const FullType(String)),
      'state',
      serializers.serialize(object.state,
          specifiedType: const FullType(String)),
      'pinCode',
      serializers.serialize(object.pinCode,
          specifiedType: const FullType(String)),
      'country',
      serializers.serialize(object.country,
          specifiedType: const FullType(String)),
      'isPaid',
      serializers.serialize(object.isPaid, specifiedType: const FullType(bool)),
      'ticketPrice',
      serializers.serialize(object.ticketPrice,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  DanceEventModal deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DanceEventModalBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'posterImg':
          result.posterImg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'venue':
          result.venue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pinCode':
          result.pinCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isPaid':
          result.isPaid = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'ticketPrice':
          result.ticketPrice = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$DanceEventModal extends DanceEventModal {
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime date;
  @override
  final String posterImg;
  @override
  final String venue;
  @override
  final String address;
  @override
  final String city;
  @override
  final String state;
  @override
  final String pinCode;
  @override
  final String country;
  @override
  final bool isPaid;
  @override
  final int ticketPrice;

  factory _$DanceEventModal([void Function(DanceEventModalBuilder) updates]) =>
      (new DanceEventModalBuilder()..update(updates)).build();

  _$DanceEventModal._(
      {this.title,
      this.description,
      this.date,
      this.posterImg,
      this.venue,
      this.address,
      this.city,
      this.state,
      this.pinCode,
      this.country,
      this.isPaid,
      this.ticketPrice})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, 'DanceEventModal', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, 'DanceEventModal', 'description');
    BuiltValueNullFieldError.checkNotNull(date, 'DanceEventModal', 'date');
    BuiltValueNullFieldError.checkNotNull(
        posterImg, 'DanceEventModal', 'posterImg');
    BuiltValueNullFieldError.checkNotNull(venue, 'DanceEventModal', 'venue');
    BuiltValueNullFieldError.checkNotNull(
        address, 'DanceEventModal', 'address');
    BuiltValueNullFieldError.checkNotNull(city, 'DanceEventModal', 'city');
    BuiltValueNullFieldError.checkNotNull(state, 'DanceEventModal', 'state');
    BuiltValueNullFieldError.checkNotNull(
        pinCode, 'DanceEventModal', 'pinCode');
    BuiltValueNullFieldError.checkNotNull(
        country, 'DanceEventModal', 'country');
    BuiltValueNullFieldError.checkNotNull(isPaid, 'DanceEventModal', 'isPaid');
    BuiltValueNullFieldError.checkNotNull(
        ticketPrice, 'DanceEventModal', 'ticketPrice');
  }

  @override
  DanceEventModal rebuild(void Function(DanceEventModalBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DanceEventModalBuilder toBuilder() =>
      new DanceEventModalBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DanceEventModal &&
        title == other.title &&
        description == other.description &&
        date == other.date &&
        posterImg == other.posterImg &&
        venue == other.venue &&
        address == other.address &&
        city == other.city &&
        state == other.state &&
        pinCode == other.pinCode &&
        country == other.country &&
        isPaid == other.isPaid &&
        ticketPrice == other.ticketPrice;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, title.hashCode),
                                                description.hashCode),
                                            date.hashCode),
                                        posterImg.hashCode),
                                    venue.hashCode),
                                address.hashCode),
                            city.hashCode),
                        state.hashCode),
                    pinCode.hashCode),
                country.hashCode),
            isPaid.hashCode),
        ticketPrice.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DanceEventModal')
          ..add('title', title)
          ..add('description', description)
          ..add('date', date)
          ..add('posterImg', posterImg)
          ..add('venue', venue)
          ..add('address', address)
          ..add('city', city)
          ..add('state', state)
          ..add('pinCode', pinCode)
          ..add('country', country)
          ..add('isPaid', isPaid)
          ..add('ticketPrice', ticketPrice))
        .toString();
  }
}

class DanceEventModalBuilder
    implements Builder<DanceEventModal, DanceEventModalBuilder> {
  _$DanceEventModal _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  String _posterImg;
  String get posterImg => _$this._posterImg;
  set posterImg(String posterImg) => _$this._posterImg = posterImg;

  String _venue;
  String get venue => _$this._venue;
  set venue(String venue) => _$this._venue = venue;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  String _state;
  String get state => _$this._state;
  set state(String state) => _$this._state = state;

  String _pinCode;
  String get pinCode => _$this._pinCode;
  set pinCode(String pinCode) => _$this._pinCode = pinCode;

  String _country;
  String get country => _$this._country;
  set country(String country) => _$this._country = country;

  bool _isPaid;
  bool get isPaid => _$this._isPaid;
  set isPaid(bool isPaid) => _$this._isPaid = isPaid;

  int _ticketPrice;
  int get ticketPrice => _$this._ticketPrice;
  set ticketPrice(int ticketPrice) => _$this._ticketPrice = ticketPrice;

  DanceEventModalBuilder();

  DanceEventModalBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _date = $v.date;
      _posterImg = $v.posterImg;
      _venue = $v.venue;
      _address = $v.address;
      _city = $v.city;
      _state = $v.state;
      _pinCode = $v.pinCode;
      _country = $v.country;
      _isPaid = $v.isPaid;
      _ticketPrice = $v.ticketPrice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DanceEventModal other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DanceEventModal;
  }

  @override
  void update(void Function(DanceEventModalBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DanceEventModal build() {
    final _$result = _$v ??
        new _$DanceEventModal._(
            title: BuiltValueNullFieldError.checkNotNull(
                title, 'DanceEventModal', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, 'DanceEventModal', 'description'),
            date: BuiltValueNullFieldError.checkNotNull(
                date, 'DanceEventModal', 'date'),
            posterImg: BuiltValueNullFieldError.checkNotNull(
                posterImg, 'DanceEventModal', 'posterImg'),
            venue: BuiltValueNullFieldError.checkNotNull(
                venue, 'DanceEventModal', 'venue'),
            address: BuiltValueNullFieldError.checkNotNull(
                address, 'DanceEventModal', 'address'),
            city: BuiltValueNullFieldError.checkNotNull(
                city, 'DanceEventModal', 'city'),
            state: BuiltValueNullFieldError.checkNotNull(
                state, 'DanceEventModal', 'state'),
            pinCode: BuiltValueNullFieldError.checkNotNull(
                pinCode, 'DanceEventModal', 'pinCode'),
            country: BuiltValueNullFieldError.checkNotNull(country, 'DanceEventModal', 'country'),
            isPaid: BuiltValueNullFieldError.checkNotNull(isPaid, 'DanceEventModal', 'isPaid'),
            ticketPrice: BuiltValueNullFieldError.checkNotNull(ticketPrice, 'DanceEventModal', 'ticketPrice'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
