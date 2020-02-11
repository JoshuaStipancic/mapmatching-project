#include "catch.hpp"

#include "wnl_helper.hpp"

#include <osmium/geom/mercator_projection.hpp>
#include <osmium/geom/wkb.hpp>
#include <osmium/util/endian.hpp>

#if __BYTE_ORDER == __LITTLE_ENDIAN

TEST_CASE("WKB geometry factory (byte-order-dependant), points") {
    const osmium::Location loc{3.2, 4.2};

    SECTION("point") {
        osmium::geom::WKBFactory<> factory{osmium::geom::wkb_type::wkb, osmium::geom::out_type::hex};

        const std::string wkb{factory.create_point(loc)};
        REQUIRE(wkb == "01010000009A99999999990940CDCCCCCCCCCC1040");
    }

    SECTION("point in ewkb") {
        osmium::geom::WKBFactory<> factory{osmium::geom::wkb_type::ewkb, osmium::geom::out_type::hex};

        const std::string wkb{factory.create_point(loc)};
        REQUIRE(wkb == "0101000020E61000009A99999999990940CDCCCCCCCCCC1040");
    }

#ifndef OSMIUM_USE_SLOW_MERCATOR_PROJECTION
    SECTION("point in web mercator") {
        osmium::geom::WKBFactory<osmium::geom::MercatorProjection> factory{osmium::geom::wkb_type::wkb, osmium::geom::out_type::hex};

        const std::string wkb{factory.create_point(loc)};
        REQUIRE(wkb == "010100000028706E7BF9BD1541D6A90093E48F1C41");
    }

    SECTION("point in ewkb in web mercator") {
        osmium::geom::WKBFactory<osmium::geom::MercatorProjection> factory{osmium::geom::wkb_type::ewkb, osmium::geom::out_type::hex};

        const std::string wkb{factory.create_point(loc)};
        REQUIRE(wkb == "0101000020110F000028706E7BF9BD1541D6A90093E48F1C41");
    }
#endif

}

TEST_CASE("WKB geometry factory (byte-order-dependant)") {

    osmium::memory::Buffer buffer{10000};

    SECTION("linestring") {
        osmium::geom::WKBFactory<> factory{osmium::geom::wkb_type::wkb, osmium::geom::out_type::hex};
        const auto& wnl = create_test_wnl_okay(buffer);

        {
            const std::string wkb{factory.create_linestring(wnl)};
            REQUIRE(wkb == "0102000000030000009A99999999990940CDCCCCCCCCCC10400000000000000C40CDCCCCCCCCCC1240CDCCCCCCCCCC0C409A99999999991340");
        }

        {
            const std::string wkb{factory.create_linestring(wnl, osmium::geom::use_nodes::unique, osmium::geom::direction::backward)};
            REQUIRE(wkb == "010200000003000000CDCCCCCCCCCC0C409A999999999913400000000000000C40CDCCCCCCCCCC12409A99999999990940CDCCCCCCCCCC1040");
        }

        {
            const std::string wkb{factory.create_linestring(wnl, osmium::geom::use_nodes::all)};
            REQUIRE(wkb == "0102000000040000009A99999999990940CDCCCCCCCCCC10400000000000000C40CDCCCCCCCCCC12400000000000000C40CDCCCCCCCCCC1240CDCCCCCCCCCC0C409A99999999991340");
        }

        {
            const std::string wkb{factory.create_linestring(wnl, osmium::geom::use_nodes::all, osmium::geom::direction::backward)};
            REQUIRE(wkb == "010200000004000000CDCCCCCCCCCC0C409A999999999913400000000000000C40CDCCCCCCCCCC12400000000000000C40CDCCCCCCCCCC12409A99999999990940CDCCCCCCCCCC1040");
        }
    }

    SECTION("linestring as ewkb") {
        osmium::geom::WKBFactory<> factory{osmium::geom::wkb_type::ewkb, osmium::geom::out_type::hex};

        const auto& wnl = create_test_wnl_okay(buffer);

        const std::string ewkb{factory.create_linestring(wnl)};
        REQUIRE(ewkb == "0102000020E6100000030000009A99999999990940CDCCCCCCCCCC10400000000000000C40CDCCCCCCCCCC1240CDCCCCCCCCCC0C409A99999999991340");
    }

    SECTION("linestring with two same locations") {
        osmium::geom::WKBFactory<> factory{osmium::geom::wkb_type::wkb, osmium::geom::out_type::hex};

        const auto& wnl = create_test_wnl_same_location(buffer);

        SECTION("unique forwards (default)") {
            REQUIRE_THROWS_AS(factory.create_linestring(wnl), const osmium::geometry_error&);
        }

        SECTION("unique backwards") {
            REQUIRE_THROWS_AS(factory.create_linestring(wnl, osmium::geom::use_nodes::unique, osmium::geom::direction::backward), const osmium::geometry_error&);
        }

        SECTION("all forwards") {
            const std::string wkb{factory.create_linestring(wnl, osmium::geom::use_nodes::all)};
            REQUIRE(wkb == "0102000000020000000000000000000C40CDCCCCCCCCCC12400000000000000C40CDCCCCCCCCCC1240");
        }

        SECTION("all backwards") {
            const std::string wkb{factory.create_linestring(wnl, osmium::geom::use_nodes::all, osmium::geom::direction::backward)};
            REQUIRE(wkb == "0102000000020000000000000000000C40CDCCCCCCCCCC12400000000000000C40CDCCCCCCCCCC1240");
        }
    }

    SECTION("linestring with undefined location") {
        osmium::geom::WKBFactory<> factory{osmium::geom::wkb_type::wkb, osmium::geom::out_type::hex};

        const auto& wnl = create_test_wnl_undefined_location(buffer);

        REQUIRE_THROWS_AS(factory.create_linestring(wnl), const osmium::invalid_location&);
    }

}

#endif

TEST_CASE("WKB geometry (byte-order-independent)") {

    osmium::geom::WKBFactory<> factory{osmium::geom::wkb_type::wkb, osmium::geom::out_type::hex};

    SECTION("empty point") {
        REQUIRE_THROWS_AS(factory.create_point(osmium::Location{}), const osmium::invalid_location&);
    }

    SECTION("empty linestring") {
        osmium::memory::Buffer buffer{10000};
        const auto& wnl = create_test_wnl_empty(buffer);

        REQUIRE_THROWS_AS(factory.create_linestring(wnl), const osmium::geometry_error&);
        REQUIRE_THROWS_AS(factory.create_linestring(wnl, osmium::geom::use_nodes::unique, osmium::geom::direction::backward), const osmium::geometry_error&);
        REQUIRE_THROWS_AS(factory.create_linestring(wnl, osmium::geom::use_nodes::all), const osmium::geometry_error&);
        REQUIRE_THROWS_AS(factory.create_linestring(wnl, osmium::geom::use_nodes::all, osmium::geom::direction::backward), const osmium::geometry_error&);
    }

}

