--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: agencyunitusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE agencyunitusergroupaccesses (
    agencyunitid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE agencyunitusergroupaccesses OWNER TO dhis;

--
-- Name: attribute; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE attribute (
    attributeid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    valuetype character varying(50) NOT NULL,
    mandatory boolean NOT NULL,
    isunique boolean,
    dataelementattribute boolean NOT NULL,
    dataelementgroupattribute boolean,
    indicatorattribute boolean NOT NULL,
    indicatorgroupattribute boolean,
    datasetattribute boolean,
    organisationunitattribute boolean NOT NULL,
    organisationunitgroupattribute boolean,
    organisationunitgroupsetattribute boolean,
    userattribute boolean NOT NULL,
    usergroupattribute boolean,
    programattribute boolean,
    programstageattribute boolean,
    trackedentityattribute boolean,
    trackedentityattributeattribute boolean,
    categoryoptionattribute boolean,
    categoryoptiongroupattribute boolean,
    documentattribute boolean,
    optionattribute boolean,
    optionsetattribute boolean,
    constantattribute boolean,
    legendsetattribute boolean,
    programindicatorattribute boolean,
    sqlviewattribute boolean,
    sectionattribute boolean,
    categoryoptioncomboattribute boolean,
    sortorder integer,
    optionsetid integer
);


ALTER TABLE attribute OWNER TO dhis;

--
-- Name: attributetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE attributetranslations (
    attributeid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE attributetranslations OWNER TO dhis;

--
-- Name: attributevalue; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE attributevalue (
    attributevalueid integer NOT NULL,
    created timestamp without time zone,
    lastupdated timestamp without time zone,
    value text,
    attributeid integer NOT NULL
);


ALTER TABLE attributevalue OWNER TO dhis;

--
-- Name: categories_categoryoptions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categories_categoryoptions (
    categoryid integer NOT NULL,
    sort_order integer NOT NULL,
    categoryoptionid integer NOT NULL
);


ALTER TABLE categories_categoryoptions OWNER TO dhis;

--
-- Name: categorycombo; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categorycombo (
    categorycomboid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    datadimensiontype character varying(255) NOT NULL,
    skiptotal boolean NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE categorycombo OWNER TO dhis;

--
-- Name: categorycombos_categories; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categorycombos_categories (
    categoryid integer,
    sort_order integer NOT NULL,
    categorycomboid integer NOT NULL
);


ALTER TABLE categorycombos_categories OWNER TO dhis;

--
-- Name: categorycombos_optioncombos; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categorycombos_optioncombos (
    categoryoptioncomboid integer NOT NULL,
    categorycomboid integer NOT NULL
);


ALTER TABLE categorycombos_optioncombos OWNER TO dhis;

--
-- Name: categorycombotranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categorycombotranslations (
    categorycomboid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE categorycombotranslations OWNER TO dhis;

--
-- Name: categorycombousergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categorycombousergroupaccesses (
    categorycomboid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE categorycombousergroupaccesses OWNER TO dhis;

--
-- Name: categorydimension; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categorydimension (
    categorydimensionid integer NOT NULL,
    categoryid integer
);


ALTER TABLE categorydimension OWNER TO dhis;

--
-- Name: categorydimension_items; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categorydimension_items (
    categorydimensionid integer NOT NULL,
    sort_order integer NOT NULL,
    categoryoptionid integer NOT NULL
);


ALTER TABLE categorydimension_items OWNER TO dhis;

--
-- Name: categoryoption_organisationunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categoryoption_organisationunits (
    organisationunitid integer NOT NULL,
    categoryoptionid integer NOT NULL
);


ALTER TABLE categoryoption_organisationunits OWNER TO dhis;

--
-- Name: categoryoptioncombo; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categoryoptioncombo (
    categoryoptioncomboid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name text,
    ignoreapproval boolean
);


ALTER TABLE categoryoptioncombo OWNER TO dhis;

--
-- Name: categoryoptioncomboattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categoryoptioncomboattributevalues (
    categoryoptioncomboid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE categoryoptioncomboattributevalues OWNER TO dhis;

--
-- Name: categoryoptioncombos_categoryoptions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categoryoptioncombos_categoryoptions (
    categoryoptionid integer NOT NULL,
    categoryoptioncomboid integer NOT NULL
);


ALTER TABLE categoryoptioncombos_categoryoptions OWNER TO dhis;

--
-- Name: categoryoptioncombotranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categoryoptioncombotranslations (
    categoryoptioncomboid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE categoryoptioncombotranslations OWNER TO dhis;

--
-- Name: categoryoptiongroup; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categoryoptiongroup (
    categoryoptiongroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50) NOT NULL,
    datadimensiontype character varying(255),
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE categoryoptiongroup OWNER TO dhis;

--
-- Name: categoryoptiongroupattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categoryoptiongroupattributevalues (
    categoryoptiongroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE categoryoptiongroupattributevalues OWNER TO dhis;

--
-- Name: categoryoptiongroupmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categoryoptiongroupmembers (
    categoryoptiongroupid integer NOT NULL,
    categoryoptionid integer NOT NULL
);


ALTER TABLE categoryoptiongroupmembers OWNER TO dhis;

--
-- Name: categoryoptiongroupset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categoryoptiongroupset (
    categoryoptiongroupsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    datadimension boolean NOT NULL,
    datadimensiontype character varying(255),
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE categoryoptiongroupset OWNER TO dhis;

--
-- Name: categoryoptiongroupsetmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categoryoptiongroupsetmembers (
    categoryoptiongroupid integer NOT NULL,
    categoryoptiongroupsetid integer NOT NULL,
    sort_order integer NOT NULL
);


ALTER TABLE categoryoptiongroupsetmembers OWNER TO dhis;

--
-- Name: categoryoptiongroupsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categoryoptiongroupsettranslations (
    categoryoptiongroupsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE categoryoptiongroupsettranslations OWNER TO dhis;

--
-- Name: categoryoptiongroupsetusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categoryoptiongroupsetusergroupaccesses (
    categoryoptiongroupsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE categoryoptiongroupsetusergroupaccesses OWNER TO dhis;

--
-- Name: categoryoptiongrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categoryoptiongrouptranslations (
    categoryoptiongroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE categoryoptiongrouptranslations OWNER TO dhis;

--
-- Name: categoryoptiongroupusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categoryoptiongroupusergroupaccesses (
    categoryoptiongroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE categoryoptiongroupusergroupaccesses OWNER TO dhis;

--
-- Name: categoryoptiontranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE categoryoptiontranslations (
    categoryoptionid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE categoryoptiontranslations OWNER TO dhis;

--
-- Name: chart; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE chart (
    chartid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    domainaxislabel character varying(255),
    rangeaxislabel character varying(255),
    type character varying(40) NOT NULL,
    series character varying(255),
    category character varying(255),
    hidelegend boolean,
    regressiontype character varying(40) NOT NULL,
    hidetitle boolean,
    hidesubtitle boolean,
    targetlinevalue double precision,
    targetlinelabel character varying(255),
    baselinevalue double precision,
    baselinelabel character varying(255),
    relativeperiodsid integer,
    userorganisationunit boolean,
    userorganisationunitchildren boolean,
    userorganisationunitgrandchildren boolean,
    aggregationtype character varying(40),
    completedonly boolean,
    title character varying(255),
    showdata boolean,
    hideemptyrows boolean,
    rangeaxismaxvalue double precision,
    rangeaxisminvalue double precision,
    rangeaxissteps integer,
    rangeaxisdecimals integer,
    sortorder integer,
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE chart OWNER TO dhis;

--
-- Name: chart_categorydimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE chart_categorydimensions (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    categorydimensionid integer NOT NULL
);


ALTER TABLE chart_categorydimensions OWNER TO dhis;

--
-- Name: chart_categoryoptiongroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE chart_categoryoptiongroups (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    categoryoptiongroupid integer NOT NULL
);


ALTER TABLE chart_categoryoptiongroups OWNER TO dhis;

--
-- Name: chart_datadimensionitems; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE chart_datadimensionitems (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    datadimensionitemid integer NOT NULL
);


ALTER TABLE chart_datadimensionitems OWNER TO dhis;

--
-- Name: chart_dataelementgroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE chart_dataelementgroups (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    dataelementgroupid integer NOT NULL
);


ALTER TABLE chart_dataelementgroups OWNER TO dhis;

--
-- Name: chart_filters; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE chart_filters (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    filter character varying(255)
);


ALTER TABLE chart_filters OWNER TO dhis;

--
-- Name: chart_itemorgunitgroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE chart_itemorgunitgroups (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


ALTER TABLE chart_itemorgunitgroups OWNER TO dhis;

--
-- Name: chart_organisationunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE chart_organisationunits (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    organisationunitid integer NOT NULL
);


ALTER TABLE chart_organisationunits OWNER TO dhis;

--
-- Name: chart_orgunitgroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE chart_orgunitgroups (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


ALTER TABLE chart_orgunitgroups OWNER TO dhis;

--
-- Name: chart_orgunitlevels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE chart_orgunitlevels (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitlevel integer
);


ALTER TABLE chart_orgunitlevels OWNER TO dhis;

--
-- Name: chart_periods; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE chart_periods (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    periodid integer NOT NULL
);


ALTER TABLE chart_periods OWNER TO dhis;

--
-- Name: charttranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE charttranslations (
    chartid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE charttranslations OWNER TO dhis;

--
-- Name: chartusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE chartusergroupaccesses (
    chartid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE chartusergroupaccesses OWNER TO dhis;

--
-- Name: color; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE color (
    colorid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    color character varying(255)
);


ALTER TABLE color OWNER TO dhis;

--
-- Name: colorset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE colorset (
    colorsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL
);


ALTER TABLE colorset OWNER TO dhis;

--
-- Name: colorset_colors; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE colorset_colors (
    colorsetid integer NOT NULL,
    sort_order integer NOT NULL,
    colorid integer NOT NULL
);


ALTER TABLE colorset_colors OWNER TO dhis;

--
-- Name: colorsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE colorsettranslations (
    colorsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE colorsettranslations OWNER TO dhis;

--
-- Name: colortranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE colortranslations (
    colorid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE colortranslations OWNER TO dhis;

--
-- Name: completedatasetregistration; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE completedatasetregistration (
    datasetid integer NOT NULL,
    periodid integer NOT NULL,
    sourceid integer NOT NULL,
    attributeoptioncomboid integer NOT NULL,
    date timestamp without time zone,
    storedby character varying(255)
);


ALTER TABLE completedatasetregistration OWNER TO dhis;

--
-- Name: configuration; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE configuration (
    configurationid integer NOT NULL,
    systemid character varying(255),
    feedbackrecipientsid integer,
    offlineorgunitlevelid integer,
    infrastructuralindicatorsid integer,
    infrastructuraldataelementsid integer,
    infrastructuralperiodtypeid integer,
    selfregistrationrole integer,
    selfregistrationorgunit integer
);


ALTER TABLE configuration OWNER TO dhis;

--
-- Name: configuration_corswhitelist; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE configuration_corswhitelist (
    configurationid integer NOT NULL,
    corswhitelist character varying(255)
);


ALTER TABLE configuration_corswhitelist OWNER TO dhis;

--
-- Name: constant; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE constant (
    constantid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    description text,
    value double precision NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE constant OWNER TO dhis;

--
-- Name: constantattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE constantattributevalues (
    constantid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE constantattributevalues OWNER TO dhis;

--
-- Name: constanttranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE constanttranslations (
    colorid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE constanttranslations OWNER TO dhis;

--
-- Name: constantusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE constantusergroupaccesses (
    constantid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE constantusergroupaccesses OWNER TO dhis;

--
-- Name: dashboard; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dashboard (
    dashboardid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    userid integer,
    externalaccess boolean,
    publicaccess character varying(8)
);


ALTER TABLE dashboard OWNER TO dhis;

--
-- Name: dashboard_items; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dashboard_items (
    dashboardid integer NOT NULL,
    sort_order integer NOT NULL,
    dashboarditemid integer NOT NULL
);


ALTER TABLE dashboard_items OWNER TO dhis;

--
-- Name: dashboarditem; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dashboarditem (
    dashboarditemid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    chartid integer,
    eventchartid integer,
    mapid integer,
    reporttable integer,
    eventreport integer,
    messages boolean,
    appkey character varying(255),
    shape character varying(50)
);


ALTER TABLE dashboarditem OWNER TO dhis;

--
-- Name: dashboarditem_reports; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dashboarditem_reports (
    dashboarditemid integer NOT NULL,
    sort_order integer NOT NULL,
    reportid integer NOT NULL
);


ALTER TABLE dashboarditem_reports OWNER TO dhis;

--
-- Name: dashboarditem_resources; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dashboarditem_resources (
    dashboarditemid integer NOT NULL,
    sort_order integer NOT NULL,
    resourceid integer NOT NULL
);


ALTER TABLE dashboarditem_resources OWNER TO dhis;

--
-- Name: dashboarditem_users; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dashboarditem_users (
    dashboarditemid integer NOT NULL,
    sort_order integer NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE dashboarditem_users OWNER TO dhis;

--
-- Name: dashboarditemtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dashboarditemtranslations (
    dashboarditemid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE dashboarditemtranslations OWNER TO dhis;

--
-- Name: dashboardtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dashboardtranslations (
    dashboardid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE dashboardtranslations OWNER TO dhis;

--
-- Name: dashboardusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dashboardusergroupaccesses (
    dashboardid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE dashboardusergroupaccesses OWNER TO dhis;

--
-- Name: dataapproval; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataapproval (
    dataapprovalid integer NOT NULL,
    dataapprovallevelid integer NOT NULL,
    workflowid integer NOT NULL,
    periodid integer NOT NULL,
    organisationunitid integer NOT NULL,
    attributeoptioncomboid integer NOT NULL,
    accepted boolean NOT NULL,
    created timestamp without time zone NOT NULL,
    creator integer NOT NULL
);


ALTER TABLE dataapproval OWNER TO dhis;

--
-- Name: dataapprovallevel; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataapprovallevel (
    dataapprovallevelid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    level integer NOT NULL,
    orgunitlevel integer NOT NULL,
    categoryoptiongroupsetid integer,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE dataapprovallevel OWNER TO dhis;

--
-- Name: dataapprovalleveltranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataapprovalleveltranslations (
    dataapprovallevelid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE dataapprovalleveltranslations OWNER TO dhis;

--
-- Name: dataapprovallevelusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataapprovallevelusergroupaccesses (
    dataapprovallevelid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE dataapprovallevelusergroupaccesses OWNER TO dhis;

--
-- Name: dataapprovalworkflow; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataapprovalworkflow (
    workflowid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    periodtypeid integer NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE dataapprovalworkflow OWNER TO dhis;

--
-- Name: dataapprovalworkflowlevels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataapprovalworkflowlevels (
    workflowid integer NOT NULL,
    dataapprovallevelid integer NOT NULL
);


ALTER TABLE dataapprovalworkflowlevels OWNER TO dhis;

--
-- Name: dataapprovalworkflowtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataapprovalworkflowtranslations (
    workflowid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE dataapprovalworkflowtranslations OWNER TO dhis;

--
-- Name: dataapprovalworkflowusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataapprovalworkflowusergroupaccesses (
    workflowid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE dataapprovalworkflowusergroupaccesses OWNER TO dhis;

--
-- Name: datadimensionitem; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE datadimensionitem (
    datadimensionitemid integer NOT NULL,
    indicatorid integer,
    dataelementid integer,
    dataelementoperandid integer,
    datasetid integer,
    metric character varying(50),
    programindicatorid integer,
    programdataelementid integer,
    programattributeid integer
);


ALTER TABLE datadimensionitem OWNER TO dhis;

--
-- Name: dataelement; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelement (
    dataelementid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50) NOT NULL,
    description text,
    formname character varying(230),
    valuetype character varying(50) NOT NULL,
    domaintype character varying(255) NOT NULL,
    aggregationtype character varying(50) NOT NULL,
    categorycomboid integer NOT NULL,
    url character varying(255),
    zeroissignificant boolean NOT NULL,
    optionsetid integer,
    commentoptionsetid integer,
    legendsetid integer,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE dataelement OWNER TO dhis;

--
-- Name: dataelementaggregationlevels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementaggregationlevels (
    dataelementid integer NOT NULL,
    sort_order integer NOT NULL,
    aggregationlevel integer
);


ALTER TABLE dataelementaggregationlevels OWNER TO dhis;

--
-- Name: dataelementattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementattributevalues (
    dataelementid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE dataelementattributevalues OWNER TO dhis;

--
-- Name: dataelementcategory; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementcategory (
    categoryid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    datadimensiontype character varying(255) NOT NULL,
    datadimension boolean NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE dataelementcategory OWNER TO dhis;

--
-- Name: dataelementcategoryoption; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementcategoryoption (
    categoryoptionid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    startdate date,
    enddate date,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE dataelementcategoryoption OWNER TO dhis;

--
-- Name: dataelementcategoryoptionattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementcategoryoptionattributevalues (
    categoryoptionid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE dataelementcategoryoptionattributevalues OWNER TO dhis;

--
-- Name: dataelementcategoryoptionusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementcategoryoptionusergroupaccesses (
    categoryoptionid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE dataelementcategoryoptionusergroupaccesses OWNER TO dhis;

--
-- Name: dataelementcategorytranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementcategorytranslations (
    categoryid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE dataelementcategorytranslations OWNER TO dhis;

--
-- Name: dataelementcategoryusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementcategoryusergroupaccesses (
    categoryid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE dataelementcategoryusergroupaccesses OWNER TO dhis;

--
-- Name: dataelementgroup; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementgroup (
    dataelementgroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE dataelementgroup OWNER TO dhis;

--
-- Name: dataelementgroupattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementgroupattributevalues (
    dataelementgroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE dataelementgroupattributevalues OWNER TO dhis;

--
-- Name: dataelementgroupmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementgroupmembers (
    dataelementgroupid integer NOT NULL,
    dataelementid integer NOT NULL
);


ALTER TABLE dataelementgroupmembers OWNER TO dhis;

--
-- Name: dataelementgroupset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementgroupset (
    dataelementgroupsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    compulsory boolean,
    datadimension boolean NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE dataelementgroupset OWNER TO dhis;

--
-- Name: dataelementgroupsetmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementgroupsetmembers (
    dataelementgroupid integer NOT NULL,
    dataelementgroupsetid integer NOT NULL,
    sort_order integer NOT NULL
);


ALTER TABLE dataelementgroupsetmembers OWNER TO dhis;

--
-- Name: dataelementgroupsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementgroupsettranslations (
    dataelementgroupsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE dataelementgroupsettranslations OWNER TO dhis;

--
-- Name: dataelementgroupsetusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementgroupsetusergroupaccesses (
    dataelementgroupsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE dataelementgroupsetusergroupaccesses OWNER TO dhis;

--
-- Name: dataelementgrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementgrouptranslations (
    dataelementgroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE dataelementgrouptranslations OWNER TO dhis;

--
-- Name: dataelementgroupusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementgroupusergroupaccesses (
    dataelementgroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE dataelementgroupusergroupaccesses OWNER TO dhis;

--
-- Name: dataelementoperand; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementoperand (
    dataelementoperandid integer NOT NULL,
    dataelementid integer,
    categoryoptioncomboid integer
);


ALTER TABLE dataelementoperand OWNER TO dhis;

--
-- Name: dataelementtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementtranslations (
    dataelementid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE dataelementtranslations OWNER TO dhis;

--
-- Name: dataelementusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataelementusergroupaccesses (
    dataelementid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE dataelementusergroupaccesses OWNER TO dhis;

--
-- Name: dataentryform; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataentryform (
    dataentryformid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(160) NOT NULL,
    style character varying(40),
    htmlcode text,
    format integer
);


ALTER TABLE dataentryform OWNER TO dhis;

--
-- Name: dataentryformtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataentryformtranslations (
    dataentryformid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE dataentryformtranslations OWNER TO dhis;

--
-- Name: dataset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE dataset (
    datasetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    description text,
    periodtypeid integer NOT NULL,
    categorycomboid integer NOT NULL,
    dataentryform integer,
    mobile boolean NOT NULL,
    version integer,
    expirydays integer,
    timelydays integer,
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    notifycompletinguser boolean,
    workflowid integer,
    openfutureperiods integer,
    fieldcombinationrequired boolean,
    validcompleteonly boolean,
    novaluerequirescomment boolean,
    skipoffline boolean,
    dataelementdecoration boolean,
    renderastabs boolean,
    renderhorizontally boolean,
    legendsetid integer,
    userid integer,
    publicaccess character varying(8),
    notificationrecipients integer
);


ALTER TABLE dataset OWNER TO dhis;

--
-- Name: datasetattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE datasetattributevalues (
    datasetid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE datasetattributevalues OWNER TO dhis;

--
-- Name: datasetelement; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE datasetelement (
    datasetelementid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    datasetid integer,
    dataelementid integer NOT NULL,
    categorycomboid integer
);


ALTER TABLE datasetelement OWNER TO dhis;

--
-- Name: datasetindicators; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE datasetindicators (
    datasetid integer NOT NULL,
    indicatorid integer NOT NULL
);


ALTER TABLE datasetindicators OWNER TO dhis;

--
-- Name: datasetoperands; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE datasetoperands (
    datasetid integer NOT NULL,
    dataelementoperandid integer NOT NULL
);


ALTER TABLE datasetoperands OWNER TO dhis;

--
-- Name: datasetsectiontranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE datasetsectiontranslations (
    sectionid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE datasetsectiontranslations OWNER TO dhis;

--
-- Name: datasetsource; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE datasetsource (
    datasetid integer NOT NULL,
    sourceid integer NOT NULL
);


ALTER TABLE datasetsource OWNER TO dhis;

--
-- Name: datasettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE datasettranslations (
    datasetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE datasettranslations OWNER TO dhis;

--
-- Name: datasetusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE datasetusergroupaccesses (
    datasetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE datasetusergroupaccesses OWNER TO dhis;

--
-- Name: datastatistics; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE datastatistics (
    statisticsid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    chartviews double precision,
    mapviews double precision,
    reporttableviews double precision,
    eventreportviews double precision,
    eventchartviews double precision,
    dashboardviews double precision,
    datasetreportviews double precision,
    active_users integer,
    totalviews double precision,
    charts double precision,
    maps double precision,
    reporttables double precision,
    eventreports double precision,
    eventcharts double precision,
    dashboards double precision,
    indicators double precision,
    datavalues double precision,
    users integer
);


ALTER TABLE datastatistics OWNER TO dhis;

--
-- Name: datastatisticsevent; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE datastatisticsevent (
    eventid integer NOT NULL,
    eventtype character varying,
    "timestamp" timestamp without time zone,
    username character varying(255),
    favoriteuid character varying(255)
);


ALTER TABLE datastatisticsevent OWNER TO dhis;

--
-- Name: datavalue; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE datavalue (
    dataelementid integer NOT NULL,
    periodid integer NOT NULL,
    sourceid integer NOT NULL,
    categoryoptioncomboid integer NOT NULL,
    attributeoptioncomboid integer NOT NULL,
    value character varying(50000),
    storedby character varying(255),
    created timestamp without time zone,
    lastupdated timestamp without time zone,
    comment character varying(50000),
    followup boolean,
    deleted boolean NOT NULL
);


ALTER TABLE datavalue OWNER TO dhis;

--
-- Name: datavalueaudit; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE datavalueaudit (
    datavalueauditid integer NOT NULL,
    dataelementid integer NOT NULL,
    periodid integer NOT NULL,
    organisationunitid integer NOT NULL,
    categoryoptioncomboid integer NOT NULL,
    attributeoptioncomboid integer NOT NULL,
    value character varying(50000),
    created timestamp without time zone,
    modifiedby character varying(100),
    audittype character varying(100) NOT NULL
);


ALTER TABLE datavalueaudit OWNER TO dhis;

--
-- Name: document; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE document (
    documentid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    url text NOT NULL,
    external boolean NOT NULL,
    contenttype character varying(255),
    attachment boolean,
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE document OWNER TO dhis;

--
-- Name: documentattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE documentattributevalues (
    documentid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE documentattributevalues OWNER TO dhis;

--
-- Name: documenttranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE documenttranslations (
    documentid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE documenttranslations OWNER TO dhis;

--
-- Name: documentusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE documentusergroupaccesses (
    documentid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE documentusergroupaccesses OWNER TO dhis;

--
-- Name: donorunitusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE donorunitusergroupaccesses (
    donorunitid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE donorunitusergroupaccesses OWNER TO dhis;

--
-- Name: eventchart; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventchart (
    eventchartid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    relativeperiodsid integer,
    userorganisationunit boolean,
    userorganisationunitchildren boolean,
    userorganisationunitgrandchildren boolean,
    programid integer NOT NULL,
    programstageid integer,
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    dataelementvaluedimensionid integer,
    attributevaluedimensionid integer,
    aggregationtype character varying(40),
    completedonly boolean,
    title character varying(255),
    type character varying(40) NOT NULL,
    showdata boolean,
    hideemptyrows boolean,
    hidenadata boolean,
    rangeaxismaxvalue double precision,
    rangeaxisminvalue double precision,
    rangeaxissteps integer,
    rangeaxisdecimals integer,
    outputtype character varying(30),
    collapsedatadimensions boolean,
    domainaxislabel character varying(255),
    rangeaxislabel character varying(255),
    hidelegend boolean,
    hidetitle boolean,
    hidesubtitle boolean,
    regressiontype character varying(40) NOT NULL,
    targetlinevalue double precision,
    targetlinelabel character varying(255),
    baselinevalue double precision,
    baselinelabel character varying(255),
    sortorder integer,
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE eventchart OWNER TO dhis;

--
-- Name: eventchart_attributedimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventchart_attributedimensions (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentityattributedimensionid integer NOT NULL
);


ALTER TABLE eventchart_attributedimensions OWNER TO dhis;

--
-- Name: eventchart_columns; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventchart_columns (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE eventchart_columns OWNER TO dhis;

--
-- Name: eventchart_dataelementdimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventchart_dataelementdimensions (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentitydataelementdimensionid integer NOT NULL
);


ALTER TABLE eventchart_dataelementdimensions OWNER TO dhis;

--
-- Name: eventchart_filters; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventchart_filters (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE eventchart_filters OWNER TO dhis;

--
-- Name: eventchart_itemorgunitgroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventchart_itemorgunitgroups (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


ALTER TABLE eventchart_itemorgunitgroups OWNER TO dhis;

--
-- Name: eventchart_organisationunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventchart_organisationunits (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    organisationunitid integer NOT NULL
);


ALTER TABLE eventchart_organisationunits OWNER TO dhis;

--
-- Name: eventchart_orgunitgroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventchart_orgunitgroups (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


ALTER TABLE eventchart_orgunitgroups OWNER TO dhis;

--
-- Name: eventchart_orgunitlevels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventchart_orgunitlevels (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitlevel integer
);


ALTER TABLE eventchart_orgunitlevels OWNER TO dhis;

--
-- Name: eventchart_periods; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventchart_periods (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    periodid integer NOT NULL
);


ALTER TABLE eventchart_periods OWNER TO dhis;

--
-- Name: eventchart_programindicatordimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventchart_programindicatordimensions (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentityprogramindicatordimensionid integer NOT NULL
);


ALTER TABLE eventchart_programindicatordimensions OWNER TO dhis;

--
-- Name: eventchart_rows; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventchart_rows (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE eventchart_rows OWNER TO dhis;

--
-- Name: eventcharttranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventcharttranslations (
    eventchartid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE eventcharttranslations OWNER TO dhis;

--
-- Name: eventchartusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventchartusergroupaccesses (
    eventchartid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE eventchartusergroupaccesses OWNER TO dhis;

--
-- Name: eventreport; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventreport (
    eventreportid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    relativeperiodsid integer,
    userorganisationunit boolean,
    userorganisationunitchildren boolean,
    userorganisationunitgrandchildren boolean,
    programid integer NOT NULL,
    programstageid integer,
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    dataelementvaluedimensionid integer,
    attributevaluedimensionid integer,
    aggregationtype character varying(40),
    completedonly boolean,
    title character varying(255),
    datatype character varying(40),
    rowtotals boolean,
    coltotals boolean,
    rowsubtotals boolean,
    colsubtotals boolean,
    hideemptyrows boolean,
    hidenadata boolean,
    showhierarchy boolean,
    outputtype character varying(30),
    collapsedatadimensions boolean,
    showdimensionlabels boolean,
    digitgroupseparator character varying(40),
    displaydensity character varying(40),
    fontsize character varying(40),
    sortorder integer,
    toplimit integer,
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE eventreport OWNER TO dhis;

--
-- Name: eventreport_attributedimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventreport_attributedimensions (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentityattributedimensionid integer NOT NULL
);


ALTER TABLE eventreport_attributedimensions OWNER TO dhis;

--
-- Name: eventreport_columns; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventreport_columns (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE eventreport_columns OWNER TO dhis;

--
-- Name: eventreport_dataelementdimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventreport_dataelementdimensions (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentitydataelementdimensionid integer NOT NULL
);


ALTER TABLE eventreport_dataelementdimensions OWNER TO dhis;

--
-- Name: eventreport_filters; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventreport_filters (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE eventreport_filters OWNER TO dhis;

--
-- Name: eventreport_itemorgunitgroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventreport_itemorgunitgroups (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


ALTER TABLE eventreport_itemorgunitgroups OWNER TO dhis;

--
-- Name: eventreport_organisationunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventreport_organisationunits (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    organisationunitid integer NOT NULL
);


ALTER TABLE eventreport_organisationunits OWNER TO dhis;

--
-- Name: eventreport_orgunitgroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventreport_orgunitgroups (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


ALTER TABLE eventreport_orgunitgroups OWNER TO dhis;

--
-- Name: eventreport_orgunitlevels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventreport_orgunitlevels (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitlevel integer
);


ALTER TABLE eventreport_orgunitlevels OWNER TO dhis;

--
-- Name: eventreport_periods; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventreport_periods (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    periodid integer NOT NULL
);


ALTER TABLE eventreport_periods OWNER TO dhis;

--
-- Name: eventreport_programindicatordimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventreport_programindicatordimensions (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentityprogramindicatordimensionid integer NOT NULL
);


ALTER TABLE eventreport_programindicatordimensions OWNER TO dhis;

--
-- Name: eventreport_rows; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventreport_rows (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE eventreport_rows OWNER TO dhis;

--
-- Name: eventreporttranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventreporttranslations (
    eventreportid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE eventreporttranslations OWNER TO dhis;

--
-- Name: eventreportusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE eventreportusergroupaccesses (
    eventreportid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE eventreportusergroupaccesses OWNER TO dhis;

--
-- Name: expression; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE expression (
    expressionid integer NOT NULL,
    description character varying(255),
    expression text,
    missingvaluestrategy character varying(100) NOT NULL
);


ALTER TABLE expression OWNER TO dhis;

--
-- Name: expressiondataelement; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE expressiondataelement (
    expressionid integer NOT NULL,
    dataelementid integer NOT NULL
);


ALTER TABLE expressiondataelement OWNER TO dhis;

--
-- Name: expressionsampleelement; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE expressionsampleelement (
    expressionid integer NOT NULL,
    dataelementid integer NOT NULL
);


ALTER TABLE expressionsampleelement OWNER TO dhis;

--
-- Name: externalfileresource; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE externalfileresource (
    externalfileresourceid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    accesstoken character varying(255),
    expires timestamp without time zone,
    fileresourceid integer NOT NULL
);


ALTER TABLE externalfileresource OWNER TO dhis;

--
-- Name: externalmaplayer; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE externalmaplayer (
    externalmaplayerid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    attribution text,
    url text NOT NULL,
    legendseturl text,
    maplayerposition bytea NOT NULL,
    layers text,
    imageformat bytea NOT NULL,
    mapservice bytea NOT NULL,
    legendsetid integer,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE externalmaplayer OWNER TO dhis;

--
-- Name: externalmaplayerusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE externalmaplayerusergroupaccesses (
    externalmaplayerid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE externalmaplayerusergroupaccesses OWNER TO dhis;

--
-- Name: fileresource; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE fileresource (
    fileresourceid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    contenttype character varying(255) NOT NULL,
    contentlength bigint NOT NULL,
    contentmd5 character varying(32) NOT NULL,
    storagekey character varying(1024) NOT NULL,
    isassigned boolean NOT NULL,
    storagestatus character varying(40),
    domain character varying(40),
    userid integer
);


ALTER TABLE fileresource OWNER TO dhis;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: dhis
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO dhis;

--
-- Name: i18nlocale; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE i18nlocale (
    i18nlocaleid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(250) NOT NULL,
    locale character varying(15) NOT NULL
);


ALTER TABLE i18nlocale OWNER TO dhis;

--
-- Name: incomingsms; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE incomingsms (
    id integer NOT NULL,
    originator character varying(255) NOT NULL,
    encoding integer NOT NULL,
    sentdate timestamp without time zone NOT NULL,
    receiveddate timestamp without time zone NOT NULL,
    text character varying(255),
    gatewayid character varying(255) NOT NULL,
    status integer NOT NULL,
    parsed boolean,
    statusmessage character varying(255)
);


ALTER TABLE incomingsms OWNER TO dhis;

--
-- Name: indicator; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE indicator (
    indicatorid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50) NOT NULL,
    description text,
    annualized boolean NOT NULL,
    decimals integer,
    indicatortypeid integer NOT NULL,
    numerator text NOT NULL,
    numeratordescription text,
    denominator text NOT NULL,
    denominatordescription text,
    url character varying(255),
    legendsetid integer,
    aggregateexportcategoryoptioncombo character varying(255),
    aggregateexportattributeoptioncombo character varying(255),
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE indicator OWNER TO dhis;

--
-- Name: indicatorattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE indicatorattributevalues (
    indicatorid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE indicatorattributevalues OWNER TO dhis;

--
-- Name: indicatorgroup; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE indicatorgroup (
    indicatorgroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE indicatorgroup OWNER TO dhis;

--
-- Name: indicatorgroupattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE indicatorgroupattributevalues (
    indicatorgroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE indicatorgroupattributevalues OWNER TO dhis;

--
-- Name: indicatorgroupmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE indicatorgroupmembers (
    indicatorgroupid integer NOT NULL,
    indicatorid integer NOT NULL
);


ALTER TABLE indicatorgroupmembers OWNER TO dhis;

--
-- Name: indicatorgroupset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE indicatorgroupset (
    indicatorgroupsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    compulsory boolean,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE indicatorgroupset OWNER TO dhis;

--
-- Name: indicatorgroupsetmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE indicatorgroupsetmembers (
    indicatorgroupid integer NOT NULL,
    indicatorgroupsetid integer NOT NULL,
    sort_order integer NOT NULL
);


ALTER TABLE indicatorgroupsetmembers OWNER TO dhis;

--
-- Name: indicatorgroupsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE indicatorgroupsettranslations (
    indicatorgroupsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE indicatorgroupsettranslations OWNER TO dhis;

--
-- Name: indicatorgroupsetusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE indicatorgroupsetusergroupaccesses (
    indicatorgroupsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE indicatorgroupsetusergroupaccesses OWNER TO dhis;

--
-- Name: indicatorgrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE indicatorgrouptranslations (
    indicatorgroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE indicatorgrouptranslations OWNER TO dhis;

--
-- Name: indicatorgroupusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE indicatorgroupusergroupaccesses (
    indicatorgroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE indicatorgroupusergroupaccesses OWNER TO dhis;

--
-- Name: indicatortranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE indicatortranslations (
    indicatorid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE indicatortranslations OWNER TO dhis;

--
-- Name: indicatortype; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE indicatortype (
    indicatortypeid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    indicatorfactor integer NOT NULL,
    indicatornumber boolean
);


ALTER TABLE indicatortype OWNER TO dhis;

--
-- Name: indicatortypetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE indicatortypetranslations (
    indicatortypeid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE indicatortypetranslations OWNER TO dhis;

--
-- Name: indicatorusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE indicatorusergroupaccesses (
    indicatorid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE indicatorusergroupaccesses OWNER TO dhis;

--
-- Name: intepretation_likedby; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE intepretation_likedby (
    interpretationid integer NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE intepretation_likedby OWNER TO dhis;

--
-- Name: interpretation; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE interpretation (
    interpretationid integer NOT NULL,
    uid character varying(11) NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    reporttableid integer,
    chartid integer,
    mapid integer,
    eventreportid integer,
    eventchartid integer,
    datasetid integer,
    periodid integer,
    organisationunitid integer,
    interpretationtext text,
    created timestamp without time zone NOT NULL,
    likes integer,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE interpretation OWNER TO dhis;

--
-- Name: interpretation_comments; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE interpretation_comments (
    interpretationid integer NOT NULL,
    sort_order integer NOT NULL,
    interpretationcommentid integer NOT NULL
);


ALTER TABLE interpretation_comments OWNER TO dhis;

--
-- Name: interpretationcomment; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE interpretationcomment (
    interpretationcommentid integer NOT NULL,
    uid character varying(11),
    lastupdated timestamp without time zone NOT NULL,
    commenttext text,
    userid integer NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE interpretationcomment OWNER TO dhis;

--
-- Name: interpretationusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE interpretationusergroupaccesses (
    interpretationid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE interpretationusergroupaccesses OWNER TO dhis;

--
-- Name: jphes_agencyunit; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE jphes_agencyunit (
    agencyunitid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    enabled boolean,
    description text,
    donorunitid integer NOT NULL,
    usergroupid integer NOT NULL,
    categoryoptiongroupid integer NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE jphes_agencyunit OWNER TO dhis;

--
-- Name: jphes_agencyunitmechanismunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE jphes_agencyunitmechanismunits (
    agencyunitid integer NOT NULL,
    mechanismunitid integer NOT NULL
);


ALTER TABLE jphes_agencyunitmechanismunits OWNER TO dhis;

--
-- Name: jphes_agencyunitprograms; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE jphes_agencyunitprograms (
    agencyunitid integer NOT NULL,
    programid integer NOT NULL
);


ALTER TABLE jphes_agencyunitprograms OWNER TO dhis;

--
-- Name: jphes_donorunit; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE jphes_donorunit (
    donorunitid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    enabled boolean,
    description text,
    nationalunitid integer NOT NULL,
    usergroupid integer NOT NULL,
    categoryoptiongroupid integer NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE jphes_donorunit OWNER TO dhis;

--
-- Name: jphes_donorunitagencyunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE jphes_donorunitagencyunits (
    donorunitid integer NOT NULL,
    agencyunitid integer NOT NULL
);


ALTER TABLE jphes_donorunitagencyunits OWNER TO dhis;

--
-- Name: jphes_donorunitprograms; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE jphes_donorunitprograms (
    donorunitid integer NOT NULL,
    programid integer NOT NULL
);


ALTER TABLE jphes_donorunitprograms OWNER TO dhis;

--
-- Name: jphes_mechanismunit; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE jphes_mechanismunit (
    mechanismunitid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    partner character varying(230) NOT NULL,
    enabled boolean,
    description text,
    agencyunitid integer NOT NULL,
    usergroupid integer NOT NULL,
    categoryoptionid integer NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE jphes_mechanismunit OWNER TO dhis;

--
-- Name: jphes_mechanismunitprograms; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE jphes_mechanismunitprograms (
    mechanismunitid integer NOT NULL,
    programid integer NOT NULL
);


ALTER TABLE jphes_mechanismunitprograms OWNER TO dhis;

--
-- Name: jphes_nationalunit; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE jphes_nationalunit (
    nationalunitid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    enabled boolean,
    description text,
    categoryid integer NOT NULL,
    categorycomboid integer NOT NULL,
    usergroupid integer NOT NULL,
    categoryoptiongroupsetagencyid integer NOT NULL,
    categoryoptiongroupsetdonorid integer NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE jphes_nationalunit OWNER TO dhis;

--
-- Name: jphes_nationalunitdonorunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE jphes_nationalunitdonorunits (
    nationalunitid integer NOT NULL,
    donorunitid integer NOT NULL
);


ALTER TABLE jphes_nationalunitdonorunits OWNER TO dhis;

--
-- Name: jphes_nationalunitprograms; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE jphes_nationalunitprograms (
    nationalunitid integer NOT NULL,
    programid integer NOT NULL
);


ALTER TABLE jphes_nationalunitprograms OWNER TO dhis;

--
-- Name: jphes_program; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE jphes_program (
    programid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    enabled boolean,
    description text,
    dataelementgroupid integer NOT NULL,
    indicatorgroupid integer NOT NULL
);


ALTER TABLE jphes_program OWNER TO dhis;

--
-- Name: jphes_programdataelements; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE jphes_programdataelements (
    programid integer NOT NULL,
    dataelementid integer NOT NULL
);


ALTER TABLE jphes_programdataelements OWNER TO dhis;

--
-- Name: jphes_programindicators; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE jphes_programindicators (
    programid integer NOT NULL,
    indicatorid integer NOT NULL
);


ALTER TABLE jphes_programindicators OWNER TO dhis;

--
-- Name: keyjsonvalue; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE keyjsonvalue (
    keyjsonvalueid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    namespace character varying(255) NOT NULL,
    namespacekey character varying(255) NOT NULL,
    value text,
    encrypted_value character varying(255),
    encrypted boolean
);


ALTER TABLE keyjsonvalue OWNER TO dhis;

--
-- Name: legendsetattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE legendsetattributevalues (
    legendsetid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE legendsetattributevalues OWNER TO dhis;

--
-- Name: legendsetusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE legendsetusergroupaccesses (
    maplegendsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE legendsetusergroupaccesses OWNER TO dhis;

--
-- Name: lockexception; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE lockexception (
    lockexceptionid integer NOT NULL,
    organisationunitid integer,
    periodid integer,
    datasetid integer
);


ALTER TABLE lockexception OWNER TO dhis;

--
-- Name: map; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE map (
    mapid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    longitude double precision,
    latitude double precision,
    zoom integer,
    basemap character varying(255),
    title character varying(255),
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE map OWNER TO dhis;

--
-- Name: maplegend; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE maplegend (
    maplegendid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    startvalue double precision,
    endvalue double precision,
    color character varying(255),
    image character varying(255)
);


ALTER TABLE maplegend OWNER TO dhis;

--
-- Name: maplegendset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE maplegendset (
    maplegendsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    symbolizer character varying(255),
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE maplegendset OWNER TO dhis;

--
-- Name: maplegendsetmaplegend; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE maplegendsetmaplegend (
    legendsetid integer NOT NULL,
    maplegendid integer NOT NULL
);


ALTER TABLE maplegendsetmaplegend OWNER TO dhis;

--
-- Name: maplegendsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE maplegendsettranslations (
    maplegendsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE maplegendsettranslations OWNER TO dhis;

--
-- Name: maplegendtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE maplegendtranslations (
    maplegendid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE maplegendtranslations OWNER TO dhis;

--
-- Name: mapmapviews; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE mapmapviews (
    mapid integer NOT NULL,
    sort_order integer NOT NULL,
    mapviewid integer NOT NULL
);


ALTER TABLE mapmapviews OWNER TO dhis;

--
-- Name: mapusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE mapusergroupaccesses (
    mapid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE mapusergroupaccesses OWNER TO dhis;

--
-- Name: mapview; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE mapview (
    mapviewid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    description text,
    layer character varying(255) NOT NULL,
    relativeperiodsid integer,
    userorganisationunit boolean,
    userorganisationunitchildren boolean,
    userorganisationunitgrandchildren boolean,
    aggregationtype character varying(40),
    programid integer,
    programstageid integer,
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    method integer,
    classes integer,
    colorlow character varying(255),
    colorhigh character varying(255),
    colorscale character varying(255),
    legendsetid integer,
    radiuslow integer,
    radiushigh integer,
    opacity double precision,
    orgunitgroupsetid integer,
    arearadius integer,
    hidden boolean,
    labels boolean,
    labelfontsize character varying(255),
    labelfontweight character varying(255),
    labelfontstyle character varying(255),
    labelfontcolor character varying(255),
    eventclustering boolean,
    eventpointcolor character varying(255),
    eventpointradius integer,
    config text
);


ALTER TABLE mapview OWNER TO dhis;

--
-- Name: mapview_attributedimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE mapview_attributedimensions (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentityattributedimensionid integer NOT NULL
);


ALTER TABLE mapview_attributedimensions OWNER TO dhis;

--
-- Name: mapview_columns; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE mapview_columns (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE mapview_columns OWNER TO dhis;

--
-- Name: mapview_datadimensionitems; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE mapview_datadimensionitems (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    datadimensionitemid integer NOT NULL
);


ALTER TABLE mapview_datadimensionitems OWNER TO dhis;

--
-- Name: mapview_dataelementdimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE mapview_dataelementdimensions (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentitydataelementdimensionid integer NOT NULL
);


ALTER TABLE mapview_dataelementdimensions OWNER TO dhis;

--
-- Name: mapview_itemorgunitgroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE mapview_itemorgunitgroups (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


ALTER TABLE mapview_itemorgunitgroups OWNER TO dhis;

--
-- Name: mapview_organisationunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE mapview_organisationunits (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    organisationunitid integer NOT NULL
);


ALTER TABLE mapview_organisationunits OWNER TO dhis;

--
-- Name: mapview_orgunitlevels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE mapview_orgunitlevels (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitlevel integer
);


ALTER TABLE mapview_orgunitlevels OWNER TO dhis;

--
-- Name: mapview_periods; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE mapview_periods (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    periodid integer NOT NULL
);


ALTER TABLE mapview_periods OWNER TO dhis;

--
-- Name: mapviewtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE mapviewtranslations (
    mapviewid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE mapviewtranslations OWNER TO dhis;

--
-- Name: mechanismunitusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE mechanismunitusergroupaccesses (
    mechanismunitid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE mechanismunitusergroupaccesses OWNER TO dhis;

--
-- Name: message; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE message (
    messageid integer NOT NULL,
    uid character varying(11),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    messagetext text,
    internal boolean,
    metadata character varying(255),
    userid integer
);


ALTER TABLE message OWNER TO dhis;

--
-- Name: messageconversation; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE messageconversation (
    messageconversationid integer NOT NULL,
    uid character varying(11),
    messagecount integer,
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    subject character varying(255) NOT NULL,
    priority character varying(255),
    status character varying(255),
    lastsenderid integer,
    lastmessage timestamp without time zone,
    userid integer
);


ALTER TABLE messageconversation OWNER TO dhis;

--
-- Name: messageconversation_messages; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE messageconversation_messages (
    messageconversationid integer NOT NULL,
    sort_order integer NOT NULL,
    messageid integer NOT NULL
);


ALTER TABLE messageconversation_messages OWNER TO dhis;

--
-- Name: messageconversation_usermessages; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE messageconversation_usermessages (
    messageconversationid integer NOT NULL,
    usermessageid integer NOT NULL
);


ALTER TABLE messageconversation_usermessages OWNER TO dhis;

--
-- Name: metadataversion; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE metadataversion (
    versionid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    versiontype character varying(50),
    importdate timestamp without time zone,
    hashcode character varying(50) NOT NULL
);


ALTER TABLE metadataversion OWNER TO dhis;

--
-- Name: minmaxdataelement; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE minmaxdataelement (
    minmaxdataelementid integer NOT NULL,
    sourceid integer,
    dataelementid integer,
    categoryoptioncomboid integer,
    minimumvalue integer NOT NULL,
    maximumvalue integer NOT NULL,
    generatedvalue boolean NOT NULL
);


ALTER TABLE minmaxdataelement OWNER TO dhis;

--
-- Name: nationalunitusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE nationalunitusergroupaccesses (
    nationalunitid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE nationalunitusergroupaccesses OWNER TO dhis;

--
-- Name: oauth2client; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE oauth2client (
    oauth2clientid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    cid character varying(230) NOT NULL,
    secret character varying(512) NOT NULL
);


ALTER TABLE oauth2client OWNER TO dhis;

--
-- Name: oauth2clientgranttypes; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE oauth2clientgranttypes (
    oauth2clientid integer NOT NULL,
    sort_order integer NOT NULL,
    granttype character varying(255)
);


ALTER TABLE oauth2clientgranttypes OWNER TO dhis;

--
-- Name: oauth2clientredirecturis; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE oauth2clientredirecturis (
    oauth2clientid integer NOT NULL,
    sort_order integer NOT NULL,
    redirecturi character varying(255)
);


ALTER TABLE oauth2clientredirecturis OWNER TO dhis;

--
-- Name: oauth_access_token; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE oauth_access_token (
    token_id character varying(256),
    token bytea,
    authentication_id character varying(256) NOT NULL,
    user_name character varying(256),
    client_id character varying(256),
    authentication bytea,
    refresh_token character varying(256)
);


ALTER TABLE oauth_access_token OWNER TO dhis;

--
-- Name: oauth_code; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE oauth_code (
    code character varying(256),
    authentication bytea
);


ALTER TABLE oauth_code OWNER TO dhis;

--
-- Name: oauth_refresh_token; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE oauth_refresh_token (
    token_id character varying(256),
    token bytea,
    authentication bytea
);


ALTER TABLE oauth_refresh_token OWNER TO dhis;

--
-- Name: objecttranslation; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE objecttranslation (
    objecttranslationid integer NOT NULL,
    locale character varying(15) NOT NULL,
    property character varying(50) NOT NULL,
    value text NOT NULL
);


ALTER TABLE objecttranslation OWNER TO dhis;

--
-- Name: optionattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE optionattributevalues (
    optionvalueid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE optionattributevalues OWNER TO dhis;

--
-- Name: optiongroup; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE optiongroup (
    optiongroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50) NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE optiongroup OWNER TO dhis;

--
-- Name: optiongroupattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE optiongroupattributevalues (
    optiongroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE optiongroupattributevalues OWNER TO dhis;

--
-- Name: optiongroupmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE optiongroupmembers (
    optiongroupid integer NOT NULL,
    optionid integer NOT NULL
);


ALTER TABLE optiongroupmembers OWNER TO dhis;

--
-- Name: optiongroupset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE optiongroupset (
    optiongroupsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    datadimension boolean NOT NULL,
    optionsetid integer,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE optiongroupset OWNER TO dhis;

--
-- Name: optiongroupsetmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE optiongroupsetmembers (
    optiongroupsetid integer NOT NULL,
    sort_order integer NOT NULL,
    optiongroupid integer NOT NULL
);


ALTER TABLE optiongroupsetmembers OWNER TO dhis;

--
-- Name: optiongroupsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE optiongroupsettranslations (
    optiongroupsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE optiongroupsettranslations OWNER TO dhis;

--
-- Name: optiongroupsetusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE optiongroupsetusergroupaccesses (
    optiongroupsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE optiongroupsetusergroupaccesses OWNER TO dhis;

--
-- Name: optiongrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE optiongrouptranslations (
    optiongroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE optiongrouptranslations OWNER TO dhis;

--
-- Name: optiongroupusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE optiongroupusergroupaccesses (
    optiongroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE optiongroupusergroupaccesses OWNER TO dhis;

--
-- Name: optionset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE optionset (
    optionsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    valuetype character varying(50) NOT NULL,
    version integer,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE optionset OWNER TO dhis;

--
-- Name: optionsetattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE optionsetattributevalues (
    optionsetid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE optionsetattributevalues OWNER TO dhis;

--
-- Name: optionsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE optionsettranslations (
    optionsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE optionsettranslations OWNER TO dhis;

--
-- Name: optionsetusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE optionsetusergroupaccesses (
    optionsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE optionsetusergroupaccesses OWNER TO dhis;

--
-- Name: optionvalue; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE optionvalue (
    optionvalueid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(230),
    name character varying(230) NOT NULL,
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    optionsetid integer,
    sort_order integer
);


ALTER TABLE optionvalue OWNER TO dhis;

--
-- Name: optionvaluetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE optionvaluetranslations (
    optionvalueid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE optionvaluetranslations OWNER TO dhis;

--
-- Name: organisationunit; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE organisationunit (
    organisationunitid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50) NOT NULL,
    parentid integer,
    path character varying(255),
    hierarchylevel integer,
    description text,
    openingdate date NOT NULL,
    closeddate date,
    comment text,
    featuretype character varying(50),
    coordinates text,
    url character varying(255),
    contactperson character varying(255),
    address character varying(255),
    email character varying(150),
    phonenumber character varying(150),
    userid integer
);


ALTER TABLE organisationunit OWNER TO dhis;

--
-- Name: organisationunitattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE organisationunitattributevalues (
    organisationunitid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE organisationunitattributevalues OWNER TO dhis;

--
-- Name: organisationunittranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE organisationunittranslations (
    organisationunitid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE organisationunittranslations OWNER TO dhis;

--
-- Name: orgunitgroup; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE orgunitgroup (
    orgunitgroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    symbol character varying(255),
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE orgunitgroup OWNER TO dhis;

--
-- Name: orgunitgroupattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE orgunitgroupattributevalues (
    orgunitgroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE orgunitgroupattributevalues OWNER TO dhis;

--
-- Name: orgunitgroupmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE orgunitgroupmembers (
    organisationunitid integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


ALTER TABLE orgunitgroupmembers OWNER TO dhis;

--
-- Name: orgunitgroupset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE orgunitgroupset (
    orgunitgroupsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    compulsory boolean NOT NULL,
    datadimension boolean NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE orgunitgroupset OWNER TO dhis;

--
-- Name: orgunitgroupsetattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE orgunitgroupsetattributevalues (
    orgunitgroupsetid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE orgunitgroupsetattributevalues OWNER TO dhis;

--
-- Name: orgunitgroupsetmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE orgunitgroupsetmembers (
    orgunitgroupid integer NOT NULL,
    orgunitgroupsetid integer NOT NULL
);


ALTER TABLE orgunitgroupsetmembers OWNER TO dhis;

--
-- Name: orgunitgroupsettranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE orgunitgroupsettranslations (
    orgunitgroupsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE orgunitgroupsettranslations OWNER TO dhis;

--
-- Name: orgunitgroupsetusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE orgunitgroupsetusergroupaccesses (
    orgunitgroupsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE orgunitgroupsetusergroupaccesses OWNER TO dhis;

--
-- Name: orgunitgrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE orgunitgrouptranslations (
    orgunitgroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE orgunitgrouptranslations OWNER TO dhis;

--
-- Name: orgunitgroupusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE orgunitgroupusergroupaccesses (
    orgunitgroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE orgunitgroupusergroupaccesses OWNER TO dhis;

--
-- Name: orgunitlevel; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE orgunitlevel (
    orgunitlevelid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    level integer NOT NULL,
    offlinelevels integer
);


ALTER TABLE orgunitlevel OWNER TO dhis;

--
-- Name: orgunitleveltranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE orgunitleveltranslations (
    orgunitlevelid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE orgunitleveltranslations OWNER TO dhis;

--
-- Name: outbound_sms; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE outbound_sms (
    id integer NOT NULL,
    date timestamp without time zone NOT NULL,
    message character varying(500),
    status integer NOT NULL,
    sender character varying(255)
);


ALTER TABLE outbound_sms OWNER TO dhis;

--
-- Name: outbound_sms_recipients; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE outbound_sms_recipients (
    outbound_sms_id integer NOT NULL,
    elt text
);


ALTER TABLE outbound_sms_recipients OWNER TO dhis;

--
-- Name: period; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE period (
    periodid integer NOT NULL,
    periodtypeid integer,
    startdate date NOT NULL,
    enddate date NOT NULL
);


ALTER TABLE period OWNER TO dhis;

--
-- Name: periodtype; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE periodtype (
    periodtypeid integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE periodtype OWNER TO dhis;

--
-- Name: predictor; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE predictor (
    predictorid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    generatorexpressionid integer NOT NULL,
    generatoroutput integer NOT NULL,
    generatoroutputcombo integer,
    skiptestexpressionid integer,
    periodtypeid integer NOT NULL,
    sequentialsamplecount integer NOT NULL,
    annualsamplecount integer NOT NULL,
    sequentialskipcount integer
);


ALTER TABLE predictor OWNER TO dhis;

--
-- Name: predictororgunitlevels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE predictororgunitlevels (
    predictorid integer NOT NULL,
    orgunitlevelid integer NOT NULL
);


ALTER TABLE predictororgunitlevels OWNER TO dhis;

--
-- Name: program; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE program (
    programid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    description text,
    version integer,
    enrollmentdatelabel text,
    incidentdatelabel text,
    type character varying(255) NOT NULL,
    displayincidentdate boolean,
    onlyenrollonce boolean,
    skipoffline boolean NOT NULL,
    displayfrontpagelist boolean,
    usefirststageduringregistration boolean,
    capturecoordinates boolean,
    expirydays integer,
    completeeventsexpirydays integer,
    expiryperiodtypeid integer,
    ignoreoverdueevents boolean,
    selectenrollmentdatesinfuture boolean,
    selectincidentdatesinfuture boolean,
    relationshiptext character varying(255),
    relationshiptypeid integer,
    relationshipfroma boolean,
    relatedprogramid integer,
    dataentrymethod boolean,
    categorycomboid integer NOT NULL,
    trackedentityid integer,
    dataentryformid integer,
    workflowid integer,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE program OWNER TO dhis;

--
-- Name: program_attributes; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE program_attributes (
    programtrackedentityattributeid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    programid integer,
    trackedentityattributeid integer,
    displayinlist boolean,
    mandatory boolean,
    allowfuturedate boolean,
    sort_order integer
);


ALTER TABLE program_attributes OWNER TO dhis;

--
-- Name: program_criteria; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE program_criteria (
    programid integer NOT NULL,
    validationcriteriaid integer NOT NULL
);


ALTER TABLE program_criteria OWNER TO dhis;

--
-- Name: program_organisationunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE program_organisationunits (
    organisationunitid integer NOT NULL,
    programid integer NOT NULL
);


ALTER TABLE program_organisationunits OWNER TO dhis;

--
-- Name: program_userroles; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE program_userroles (
    userroleid integer NOT NULL,
    programid integer NOT NULL
);


ALTER TABLE program_userroles OWNER TO dhis;

--
-- Name: programattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programattributevalues (
    programid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE programattributevalues OWNER TO dhis;

--
-- Name: programdataelement; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programdataelement (
    programdataelementid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    programid integer NOT NULL,
    dataelementid integer NOT NULL
);


ALTER TABLE programdataelement OWNER TO dhis;

--
-- Name: programdataelementtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programdataelementtranslations (
    programdataelementid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE programdataelementtranslations OWNER TO dhis;

--
-- Name: programexpression; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programexpression (
    programexpressionid integer NOT NULL,
    description character varying(255),
    expression text
);


ALTER TABLE programexpression OWNER TO dhis;

--
-- Name: programindicator; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programindicator (
    programindicatorid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(255),
    description text,
    programid integer NOT NULL,
    expression text,
    filter text,
    aggregationtype character varying(40),
    decimals integer,
    legendsetid integer,
    aggregateexportcategoryoptioncombo character varying(255),
    aggregateexportattributeoptioncombo character varying(255),
    displayinform boolean,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE programindicator OWNER TO dhis;

--
-- Name: programindicatorattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programindicatorattributevalues (
    programindicatorid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE programindicatorattributevalues OWNER TO dhis;

--
-- Name: programindicatorgroup; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programindicatorgroup (
    programindicatorgroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE programindicatorgroup OWNER TO dhis;

--
-- Name: programindicatorgroupattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programindicatorgroupattributevalues (
    programindicatorgroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE programindicatorgroupattributevalues OWNER TO dhis;

--
-- Name: programindicatorgroupmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programindicatorgroupmembers (
    programindicatorgroupid integer NOT NULL,
    programindicatorid integer NOT NULL
);


ALTER TABLE programindicatorgroupmembers OWNER TO dhis;

--
-- Name: programindicatorgrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programindicatorgrouptranslations (
    programindicatorgroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE programindicatorgrouptranslations OWNER TO dhis;

--
-- Name: programindicatorgroupusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programindicatorgroupusergroupaccesses (
    programindicatorgroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE programindicatorgroupusergroupaccesses OWNER TO dhis;

--
-- Name: programindicatortranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programindicatortranslations (
    programindicatorid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE programindicatortranslations OWNER TO dhis;

--
-- Name: programindicatorusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programindicatorusergroupaccesses (
    programindicatorid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE programindicatorusergroupaccesses OWNER TO dhis;

--
-- Name: programinstance; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programinstance (
    programinstanceid integer NOT NULL,
    uid character varying(11),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    incidentdate timestamp without time zone,
    enrollmentdate timestamp without time zone NOT NULL,
    enddate timestamp without time zone,
    followup boolean,
    completedby character varying(255),
    longitude double precision,
    latitude double precision,
    status character varying(50),
    trackedentityinstanceid integer,
    programid integer NOT NULL,
    organisationunitid integer
);


ALTER TABLE programinstance OWNER TO dhis;

--
-- Name: programinstance_messageconversation; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programinstance_messageconversation (
    programinstanceid integer NOT NULL,
    sort_order integer NOT NULL,
    messageconversationid integer NOT NULL
);


ALTER TABLE programinstance_messageconversation OWNER TO dhis;

--
-- Name: programinstancecomments; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programinstancecomments (
    programinstanceid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentitycommentid integer NOT NULL
);


ALTER TABLE programinstancecomments OWNER TO dhis;

--
-- Name: programmessage; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programmessage (
    id integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    text character varying(500) NOT NULL,
    subject character varying(200),
    processeddate timestamp without time zone,
    messagestatus character varying(50),
    trackedentityinstanceid integer,
    organisationunitid integer,
    programinstanceid integer,
    programstageinstanceid integer
);


ALTER TABLE programmessage OWNER TO dhis;

--
-- Name: programmessage_deliverychannels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programmessage_deliverychannels (
    programmessagedeliverychannelsid integer NOT NULL,
    deliverychannel character varying(255)
);


ALTER TABLE programmessage_deliverychannels OWNER TO dhis;

--
-- Name: programmessage_emailaddresses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programmessage_emailaddresses (
    programmessageemailaddressid integer NOT NULL,
    email text
);


ALTER TABLE programmessage_emailaddresses OWNER TO dhis;

--
-- Name: programmessage_phonenumbers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programmessage_phonenumbers (
    programmessagephonenumberid integer NOT NULL,
    phonenumber text
);


ALTER TABLE programmessage_phonenumbers OWNER TO dhis;

--
-- Name: programmessagetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programmessagetranslations (
    id integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE programmessagetranslations OWNER TO dhis;

--
-- Name: programnotificationtemplate; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programnotificationtemplate (
    programnotificationtemplateid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    relativescheduleddays integer,
    usergroupid integer,
    subjecttemplate character varying(100),
    messagetemplate text NOT NULL,
    notificationtrigger character varying(255),
    notificationrecipienttype character varying(255),
    programstageid integer,
    programid integer
);


ALTER TABLE programnotificationtemplate OWNER TO dhis;

--
-- Name: programnotificationtemplate_deliverychannel; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programnotificationtemplate_deliverychannel (
    programnotificationtemplatedeliverychannelid integer NOT NULL,
    deliverychannel character varying(255)
);


ALTER TABLE programnotificationtemplate_deliverychannel OWNER TO dhis;

--
-- Name: programrule; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programrule (
    programruleid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description character varying(255),
    programid integer NOT NULL,
    programstageid integer,
    rulecondition text,
    priority integer
);


ALTER TABLE programrule OWNER TO dhis;

--
-- Name: programruleaction; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programruleaction (
    programruleactionid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    programruleid integer,
    actiontype character varying(255) NOT NULL,
    dataelementid integer,
    trackedentityattributeid integer,
    programindicatorid integer,
    programstagesectionid integer,
    programstageid integer,
    location character varying(255),
    content text,
    data text
);


ALTER TABLE programruleaction OWNER TO dhis;

--
-- Name: programruletranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programruletranslations (
    programruleid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE programruletranslations OWNER TO dhis;

--
-- Name: programrulevariable; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programrulevariable (
    programrulevariableid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    programid integer NOT NULL,
    sourcetype character varying(255) NOT NULL,
    trackedentityattributeid integer,
    dataelementid integer,
    usecodeforoptionset boolean,
    programstageid integer
);


ALTER TABLE programrulevariable OWNER TO dhis;

--
-- Name: programstage; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programstage (
    programstageid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230),
    description text,
    mindaysfromstart integer NOT NULL,
    programid integer,
    repeatable boolean NOT NULL,
    dataentryformid integer,
    standardinterval integer,
    executiondatelabel character varying(255),
    autogenerateevent boolean,
    validcompleteonly boolean,
    displaygenerateeventbox boolean,
    capturecoordinates boolean,
    generatedbyenrollmentdate boolean,
    blockentryform boolean,
    remindcompleted boolean,
    allowgeneratenextvisit boolean,
    openafterenrollment boolean,
    reportdatetouse character varying(255),
    pregenerateuid boolean,
    hideduedate boolean,
    sort_order integer,
    periodtypeid integer
);


ALTER TABLE programstage OWNER TO dhis;

--
-- Name: programstageattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programstageattributevalues (
    programstageid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE programstageattributevalues OWNER TO dhis;

--
-- Name: programstagedataelement; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programstagedataelement (
    programstagedataelementid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    programstageid integer,
    dataelementid integer,
    compulsory boolean NOT NULL,
    allowprovidedelsewhere boolean,
    sort_order integer,
    displayinreports boolean,
    allowfuturedate boolean,
    programstagesectionid integer,
    section_sort_order integer
);


ALTER TABLE programstagedataelement OWNER TO dhis;

--
-- Name: programstageinstance; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programstageinstance (
    programstageinstanceid integer NOT NULL,
    uid character varying(11),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    programinstanceid integer NOT NULL,
    programstageid integer NOT NULL,
    attributeoptioncomboid integer,
    storedby character varying(255),
    duedate timestamp without time zone,
    executiondate timestamp without time zone,
    organisationunitid integer,
    status character varying(25) NOT NULL,
    longitude double precision,
    latitude double precision,
    completedby character varying(255),
    completeddate timestamp without time zone
);


ALTER TABLE programstageinstance OWNER TO dhis;

--
-- Name: programstageinstance_messageconversation; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programstageinstance_messageconversation (
    programstageinstanceid integer NOT NULL,
    sort_order integer NOT NULL,
    messageconversationid integer NOT NULL
);


ALTER TABLE programstageinstance_messageconversation OWNER TO dhis;

--
-- Name: programstageinstancecomments; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programstageinstancecomments (
    programstageinstanceid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentitycommentid integer NOT NULL
);


ALTER TABLE programstageinstancecomments OWNER TO dhis;

--
-- Name: programstagesection; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programstagesection (
    programstagesectionid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    programstageid integer,
    sortorder integer NOT NULL
);


ALTER TABLE programstagesection OWNER TO dhis;

--
-- Name: programstagesection_programindicators; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programstagesection_programindicators (
    programstagesectionid integer NOT NULL,
    sort_order integer NOT NULL,
    programindicatorid integer NOT NULL
);


ALTER TABLE programstagesection_programindicators OWNER TO dhis;

--
-- Name: programstagesectiontranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programstagesectiontranslations (
    programstagesectionid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE programstagesectiontranslations OWNER TO dhis;

--
-- Name: programstagetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programstagetranslations (
    programstageid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE programstagetranslations OWNER TO dhis;

--
-- Name: programtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programtranslations (
    programid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE programtranslations OWNER TO dhis;

--
-- Name: programusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programusergroupaccesses (
    programid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE programusergroupaccesses OWNER TO dhis;

--
-- Name: programvalidation; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programvalidation (
    programvalidationid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    leftprogramexpressionid integer,
    operator character varying(255),
    rightprogramexpressionid integer,
    programid integer NOT NULL
);


ALTER TABLE programvalidation OWNER TO dhis;

--
-- Name: programvalidationtranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE programvalidationtranslations (
    programvalidationid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE programvalidationtranslations OWNER TO dhis;

--
-- Name: pushanalysis; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE pushanalysis (
    pushanalysisid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(255) NOT NULL,
    title character varying(255),
    message text,
    enabled boolean NOT NULL,
    lastrun timestamp without time zone,
    schedulingdayoffrequency integer,
    schedulingfrequency bytea,
    dashboard integer NOT NULL
);


ALTER TABLE pushanalysis OWNER TO dhis;

--
-- Name: pushanalysisrecipientusergroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE pushanalysisrecipientusergroups (
    usergroupid integer NOT NULL,
    elt integer NOT NULL
);


ALTER TABLE pushanalysisrecipientusergroups OWNER TO dhis;

--
-- Name: relationship; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE relationship (
    relationshipid integer NOT NULL,
    trackedentityinstanceaid integer NOT NULL,
    relationshiptypeid integer NOT NULL,
    trackedentityinstancebid integer NOT NULL
);


ALTER TABLE relationship OWNER TO dhis;

--
-- Name: relationshiptype; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE relationshiptype (
    relationshiptypeid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    a_is_to_b character varying(255) NOT NULL,
    b_is_to_a character varying(255) NOT NULL
);


ALTER TABLE relationshiptype OWNER TO dhis;

--
-- Name: relationshiptypetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE relationshiptypetranslations (
    relationshiptypeid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE relationshiptypetranslations OWNER TO dhis;

--
-- Name: relativeperiods; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE relativeperiods (
    relativeperiodsid integer NOT NULL,
    thismonth boolean,
    lastmonth boolean,
    thisbimonth boolean,
    lastbimonth boolean,
    thisquarter boolean,
    lastquarter boolean,
    thissixmonth boolean,
    lastsixmonth boolean,
    monthsthisyear boolean,
    quartersthisyear boolean,
    thisyear boolean,
    monthslastyear boolean,
    quarterslastyear boolean,
    lastyear boolean,
    last5years boolean,
    last12months boolean,
    last6months boolean,
    last3months boolean,
    last6bimonths boolean,
    last4quarters boolean,
    last2sixmonths boolean,
    thisfinancialyear boolean,
    lastfinancialyear boolean,
    last5financialyears boolean,
    thisweek boolean,
    lastweek boolean,
    last4weeks boolean,
    last12weeks boolean,
    last52weeks boolean
);


ALTER TABLE relativeperiods OWNER TO dhis;

--
-- Name: report; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE report (
    reportid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    type character varying(50),
    designcontent text,
    reporttableid integer,
    relativeperiodsid integer,
    paramreportingmonth boolean,
    paramorganisationunit boolean,
    cachestrategy character varying(40),
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE report OWNER TO dhis;

--
-- Name: reporttable; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE reporttable (
    reporttableid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    regression boolean,
    cumulative boolean,
    relativeperiodsid integer,
    paramreportingmonth boolean,
    paramgrandparentorganisationunit boolean,
    paramparentorganisationunit boolean,
    paramorganisationunit boolean,
    sortorder integer,
    toplimit integer,
    rowtotals boolean,
    coltotals boolean,
    rowsubtotals boolean,
    colsubtotals boolean,
    hideemptyrows boolean,
    aggregationtype character varying(40),
    completedonly boolean,
    title character varying(255),
    digitgroupseparator character varying(40),
    displaydensity character varying(40),
    fontsize character varying(40),
    userorganisationunit boolean,
    userorganisationunitchildren boolean,
    userorganisationunitgrandchildren boolean,
    legendsetid integer,
    legenddisplaystyle character varying(40),
    showhierarchy boolean,
    showdimensionlabels boolean,
    skiprounding boolean,
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE reporttable OWNER TO dhis;

--
-- Name: reporttable_categorydimensions; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE reporttable_categorydimensions (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    categorydimensionid integer NOT NULL
);


ALTER TABLE reporttable_categorydimensions OWNER TO dhis;

--
-- Name: reporttable_categoryoptiongroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE reporttable_categoryoptiongroups (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    categoryoptiongroupid integer NOT NULL
);


ALTER TABLE reporttable_categoryoptiongroups OWNER TO dhis;

--
-- Name: reporttable_columns; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE reporttable_columns (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE reporttable_columns OWNER TO dhis;

--
-- Name: reporttable_datadimensionitems; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE reporttable_datadimensionitems (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    datadimensionitemid integer NOT NULL
);


ALTER TABLE reporttable_datadimensionitems OWNER TO dhis;

--
-- Name: reporttable_dataelementgroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE reporttable_dataelementgroups (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    dataelementgroupid integer NOT NULL
);


ALTER TABLE reporttable_dataelementgroups OWNER TO dhis;

--
-- Name: reporttable_filters; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE reporttable_filters (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE reporttable_filters OWNER TO dhis;

--
-- Name: reporttable_itemorgunitgroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE reporttable_itemorgunitgroups (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


ALTER TABLE reporttable_itemorgunitgroups OWNER TO dhis;

--
-- Name: reporttable_organisationunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE reporttable_organisationunits (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    organisationunitid integer NOT NULL
);


ALTER TABLE reporttable_organisationunits OWNER TO dhis;

--
-- Name: reporttable_orgunitgroups; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE reporttable_orgunitgroups (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


ALTER TABLE reporttable_orgunitgroups OWNER TO dhis;

--
-- Name: reporttable_orgunitlevels; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE reporttable_orgunitlevels (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitlevel integer
);


ALTER TABLE reporttable_orgunitlevels OWNER TO dhis;

--
-- Name: reporttable_periods; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE reporttable_periods (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    periodid integer NOT NULL
);


ALTER TABLE reporttable_periods OWNER TO dhis;

--
-- Name: reporttable_rows; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE reporttable_rows (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


ALTER TABLE reporttable_rows OWNER TO dhis;

--
-- Name: reporttabletranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE reporttabletranslations (
    reporttableid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE reporttabletranslations OWNER TO dhis;

--
-- Name: reporttableusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE reporttableusergroupaccesses (
    reporttableid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE reporttableusergroupaccesses OWNER TO dhis;

--
-- Name: reporttranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE reporttranslations (
    reportid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE reporttranslations OWNER TO dhis;

--
-- Name: reportusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE reportusergroupaccesses (
    reportid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE reportusergroupaccesses OWNER TO dhis;

--
-- Name: section; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE section (
    sectionid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    datasetid integer NOT NULL,
    sortorder integer NOT NULL
);


ALTER TABLE section OWNER TO dhis;

--
-- Name: sectionattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE sectionattributevalues (
    sectionid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE sectionattributevalues OWNER TO dhis;

--
-- Name: sectiondataelements; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE sectiondataelements (
    sectionid integer NOT NULL,
    sort_order integer NOT NULL,
    dataelementid integer NOT NULL
);


ALTER TABLE sectiondataelements OWNER TO dhis;

--
-- Name: sectiongreyedfields; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE sectiongreyedfields (
    sectionid integer NOT NULL,
    dataelementoperandid integer NOT NULL
);


ALTER TABLE sectiongreyedfields OWNER TO dhis;

--
-- Name: sectionindicators; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE sectionindicators (
    sectionid integer NOT NULL,
    sort_order integer NOT NULL,
    indicatorid integer NOT NULL
);


ALTER TABLE sectionindicators OWNER TO dhis;

--
-- Name: smscodes; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE smscodes (
    smscodeid integer NOT NULL,
    code character varying(255),
    formula text,
    compulsory boolean,
    dataelementid integer,
    trackedentityattributeid integer,
    optionid integer
);


ALTER TABLE smscodes OWNER TO dhis;

--
-- Name: smscommandcodes; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE smscommandcodes (
    id integer NOT NULL,
    codeid integer NOT NULL
);


ALTER TABLE smscommandcodes OWNER TO dhis;

--
-- Name: smscommands; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE smscommands (
    smscommandid integer NOT NULL,
    name text,
    parser text,
    parsertype integer,
    separatorkey text,
    codeseparator text,
    defaultmessage text,
    receivedmessage text,
    wrongformatmessage text,
    nousermessage text,
    morethanoneorgunitmessage text,
    successmessage text,
    currentperiodusedforreporting boolean,
    completenessmethod integer,
    datasetid integer,
    usergroupid integer,
    programid integer,
    programstageid integer
);


ALTER TABLE smscommands OWNER TO dhis;

--
-- Name: smscommandspecialcharacters; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE smscommandspecialcharacters (
    smscommandid integer NOT NULL,
    specialcharacterid integer NOT NULL
);


ALTER TABLE smscommandspecialcharacters OWNER TO dhis;

--
-- Name: smsspecialcharacter; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE smsspecialcharacter (
    specialcharacterid integer NOT NULL,
    name text,
    value text
);


ALTER TABLE smsspecialcharacter OWNER TO dhis;

--
-- Name: sqlview; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE sqlview (
    sqlviewid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    sqlquery text NOT NULL,
    type character varying(40),
    cachestrategy character varying(40),
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE sqlview OWNER TO dhis;

--
-- Name: sqlviewattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE sqlviewattributevalues (
    sqlviewid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE sqlviewattributevalues OWNER TO dhis;

--
-- Name: sqlviewusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE sqlviewusergroupaccesses (
    sqlviewid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE sqlviewusergroupaccesses OWNER TO dhis;

--
-- Name: systemsetting; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE systemsetting (
    systemsettingid integer NOT NULL,
    name character varying(255) NOT NULL,
    value bytea
);


ALTER TABLE systemsetting OWNER TO dhis;

--
-- Name: trackedentity; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentity (
    trackedentityid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text
);


ALTER TABLE trackedentity OWNER TO dhis;

--
-- Name: trackedentityattribute; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentityattribute (
    trackedentityattributeid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    description text,
    valuetype character varying(36) NOT NULL,
    aggregationtype character varying(40) NOT NULL,
    trackedentityattributegroupid integer,
    optionsetid integer,
    trackedentityid integer,
    legendsetid integer,
    inherit boolean,
    expression character varying(255),
    displayonvisitschedule boolean,
    sortorderinvisitschedule integer,
    displayinlistnoprogram boolean,
    sortorderinlistnoprogram integer,
    confidential boolean,
    uniquefield boolean,
    generated boolean,
    pattern character varying(255),
    orgunitscope boolean,
    programscope boolean,
    searchscope character varying(40),
    userid integer,
    publicaccess character varying(8),
    sort_order integer
);


ALTER TABLE trackedentityattribute OWNER TO dhis;

--
-- Name: trackedentityattributeattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentityattributeattributevalues (
    trackedentityattributeid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE trackedentityattributeattributevalues OWNER TO dhis;

--
-- Name: trackedentityattributedimension; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentityattributedimension (
    trackedentityattributedimensionid integer NOT NULL,
    trackedentityattributeid integer,
    legendsetid integer,
    filter character varying(255)
);


ALTER TABLE trackedentityattributedimension OWNER TO dhis;

--
-- Name: trackedentityattributegroup; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentityattributegroup (
    trackedentityattributegroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    sortorder integer
);


ALTER TABLE trackedentityattributegroup OWNER TO dhis;

--
-- Name: trackedentityattributegrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentityattributegrouptranslations (
    trackedentityattributegroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE trackedentityattributegrouptranslations OWNER TO dhis;

--
-- Name: trackedentityattributereservedvalue; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentityattributereservedvalue (
    trackedentityattributereservedvalueid integer NOT NULL,
    trackedentityattributeid integer,
    trackedentityinstanceid integer,
    created timestamp without time zone,
    expirydate timestamp without time zone,
    value character varying(50000)
);


ALTER TABLE trackedentityattributereservedvalue OWNER TO dhis;

--
-- Name: trackedentityattributetranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentityattributetranslations (
    trackedentityattributeid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE trackedentityattributetranslations OWNER TO dhis;

--
-- Name: trackedentityattributeusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentityattributeusergroupaccesses (
    trackedentityattributeid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE trackedentityattributeusergroupaccesses OWNER TO dhis;

--
-- Name: trackedentityattributevalue; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentityattributevalue (
    trackedentityinstanceid integer NOT NULL,
    trackedentityattributeid integer NOT NULL,
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    value character varying(50000),
    encryptedvalue character varying(50000)
);


ALTER TABLE trackedentityattributevalue OWNER TO dhis;

--
-- Name: trackedentityattributevalueaudit; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentityattributevalueaudit (
    trackedentityattributevalueauditid integer NOT NULL,
    trackedentityinstanceid integer,
    trackedentityattributeid integer,
    value character varying(50000),
    encryptedvalue character varying(50000),
    created timestamp without time zone,
    modifiedby character varying(255),
    audittype character varying(100) NOT NULL
);


ALTER TABLE trackedentityattributevalueaudit OWNER TO dhis;

--
-- Name: trackedentityattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentityattributevalues (
    trackedentityid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE trackedentityattributevalues OWNER TO dhis;

--
-- Name: trackedentitycomment; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentitycomment (
    trackedentitycommentid integer NOT NULL,
    commenttext text,
    createddate timestamp without time zone,
    creator character varying(255)
);


ALTER TABLE trackedentitycomment OWNER TO dhis;

--
-- Name: trackedentitydataelementdimension; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentitydataelementdimension (
    trackedentitydataelementdimensionid integer NOT NULL,
    dataelementid integer,
    legendsetid integer,
    filter character varying(255)
);


ALTER TABLE trackedentitydataelementdimension OWNER TO dhis;

--
-- Name: trackedentitydatavalue; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentitydatavalue (
    programstageinstanceid integer NOT NULL,
    dataelementid integer NOT NULL,
    value character varying(50000),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    providedelsewhere boolean,
    storedby character varying(255)
);


ALTER TABLE trackedentitydatavalue OWNER TO dhis;

--
-- Name: trackedentitydatavalueaudit; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentitydatavalueaudit (
    trackedentitydatavalueauditid integer NOT NULL,
    programstageinstanceid integer,
    dataelementid integer,
    value character varying(50000),
    created timestamp without time zone,
    providedelsewhere boolean,
    modifiedby character varying(255),
    audittype character varying(100) NOT NULL
);


ALTER TABLE trackedentitydatavalueaudit OWNER TO dhis;

--
-- Name: trackedentityinstance; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentityinstance (
    trackedentityinstanceid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    inactive boolean,
    representativeid integer,
    organisationunitid integer NOT NULL,
    trackedentityid integer
);


ALTER TABLE trackedentityinstance OWNER TO dhis;

--
-- Name: trackedentityprogramindicatordimension; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentityprogramindicatordimension (
    trackedentityprogramindicatordimensionid integer NOT NULL,
    programindicatorid integer,
    legendsetid integer,
    filter character varying(255)
);


ALTER TABLE trackedentityprogramindicatordimension OWNER TO dhis;

--
-- Name: trackedentitytranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE trackedentitytranslations (
    trackedentityid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE trackedentitytranslations OWNER TO dhis;

--
-- Name: userapps; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE userapps (
    userinfoid integer NOT NULL,
    sort_order integer NOT NULL,
    app character varying(255)
);


ALTER TABLE userapps OWNER TO dhis;

--
-- Name: userattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE userattributevalues (
    userinfoid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE userattributevalues OWNER TO dhis;

--
-- Name: userdatavieworgunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE userdatavieworgunits (
    userinfoid integer NOT NULL,
    organisationunitid integer NOT NULL
);


ALTER TABLE userdatavieworgunits OWNER TO dhis;

--
-- Name: usergroup; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE usergroup (
    usergroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE usergroup OWNER TO dhis;

--
-- Name: usergroupaccess; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE usergroupaccess (
    usergroupaccessid integer NOT NULL,
    access character varying(255),
    usergroupid integer
);


ALTER TABLE usergroupaccess OWNER TO dhis;

--
-- Name: usergroupattributevalues; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE usergroupattributevalues (
    usergroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


ALTER TABLE usergroupattributevalues OWNER TO dhis;

--
-- Name: usergroupmanaged; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE usergroupmanaged (
    managedbygroupid integer NOT NULL,
    managedgroupid integer NOT NULL
);


ALTER TABLE usergroupmanaged OWNER TO dhis;

--
-- Name: usergroupmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE usergroupmembers (
    userid integer NOT NULL,
    usergroupid integer NOT NULL
);


ALTER TABLE usergroupmembers OWNER TO dhis;

--
-- Name: usergrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE usergrouptranslations (
    usergroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE usergrouptranslations OWNER TO dhis;

--
-- Name: usergroupusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE usergroupusergroupaccesses (
    usergroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE usergroupusergroupaccesses OWNER TO dhis;

--
-- Name: userinfo; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE userinfo (
    userinfoid integer NOT NULL,
    uid character varying(11),
    code character varying(50),
    lastupdated timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL,
    surname character varying(160) NOT NULL,
    firstname character varying(160) NOT NULL,
    email character varying(160),
    phonenumber character varying(80),
    jobtitle character varying(160),
    introduction text,
    gender character varying(50),
    birthday date,
    nationality character varying(160),
    employer character varying(160),
    education text,
    interests text,
    languages text,
    lastcheckedinterpretations timestamp without time zone
);


ALTER TABLE userinfo OWNER TO dhis;

--
-- Name: userkeyjsonvalue; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE userkeyjsonvalue (
    userkeyjsonvalueid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    userid integer NOT NULL,
    namespace character varying(255) NOT NULL,
    userkey character varying(255) NOT NULL,
    value text,
    encrypted_value character varying(255),
    encrypted boolean
);


ALTER TABLE userkeyjsonvalue OWNER TO dhis;

--
-- Name: usermembership; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE usermembership (
    userinfoid integer NOT NULL,
    organisationunitid integer NOT NULL
);


ALTER TABLE usermembership OWNER TO dhis;

--
-- Name: usermessage; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE usermessage (
    usermessageid integer NOT NULL,
    usermessagekey character varying(255),
    userid integer NOT NULL,
    isread boolean NOT NULL,
    isfollowup boolean
);


ALTER TABLE usermessage OWNER TO dhis;

--
-- Name: userrole; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE userrole (
    userroleid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description character varying(255),
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE userrole OWNER TO dhis;

--
-- Name: userroleauthorities; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE userroleauthorities (
    userroleid integer NOT NULL,
    authority character varying(255)
);


ALTER TABLE userroleauthorities OWNER TO dhis;

--
-- Name: userroledataset; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE userroledataset (
    userroleid integer NOT NULL,
    datasetid integer NOT NULL
);


ALTER TABLE userroledataset OWNER TO dhis;

--
-- Name: userrolemembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE userrolemembers (
    userid integer NOT NULL,
    userroleid integer NOT NULL
);


ALTER TABLE userrolemembers OWNER TO dhis;

--
-- Name: userroletranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE userroletranslations (
    userroleid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE userroletranslations OWNER TO dhis;

--
-- Name: userroleusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE userroleusergroupaccesses (
    userroleid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE userroleusergroupaccesses OWNER TO dhis;

--
-- Name: users; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE users (
    userid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    creatoruserid integer,
    username character varying(255) NOT NULL,
    password character varying(60),
    externalauth boolean,
    openid text,
    ldapid text,
    passwordlastupdated timestamp without time zone,
    lastlogin timestamp without time zone,
    restoretoken character varying(255),
    restorecode character varying(255),
    restoreexpiry timestamp without time zone,
    selfregistered boolean,
    invitation boolean,
    disabled boolean
);


ALTER TABLE users OWNER TO dhis;

--
-- Name: users_catdimensionconstraints; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE users_catdimensionconstraints (
    userid integer NOT NULL,
    dataelementcategoryid integer NOT NULL
);


ALTER TABLE users_catdimensionconstraints OWNER TO dhis;

--
-- Name: users_cogsdimensionconstraints; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE users_cogsdimensionconstraints (
    userid integer NOT NULL,
    categoryoptiongroupsetid integer NOT NULL
);


ALTER TABLE users_cogsdimensionconstraints OWNER TO dhis;

--
-- Name: usersetting; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE usersetting (
    userinfoid integer NOT NULL,
    name character varying(255) NOT NULL,
    value bytea
);


ALTER TABLE usersetting OWNER TO dhis;

--
-- Name: userteisearchorgunits; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE userteisearchorgunits (
    userinfoid integer NOT NULL,
    organisationunitid integer NOT NULL
);


ALTER TABLE userteisearchorgunits OWNER TO dhis;

--
-- Name: validationcriteria; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE validationcriteria (
    validationcriteriaid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description character varying(255),
    property character varying(255),
    operator integer NOT NULL,
    value bytea
);


ALTER TABLE validationcriteria OWNER TO dhis;

--
-- Name: validationcriteriatranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE validationcriteriatranslations (
    validationcriteriaid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE validationcriteriatranslations OWNER TO dhis;

--
-- Name: validationrule; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE validationrule (
    validationruleid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    instruction text,
    importance character varying(50),
    operator character varying(255) NOT NULL,
    leftexpressionid integer,
    rightexpressionid integer,
    periodtypeid integer NOT NULL
);


ALTER TABLE validationrule OWNER TO dhis;

--
-- Name: validationrulegroup; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE validationrulegroup (
    validationrulegroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    alertbyorgunits boolean,
    userid integer,
    publicaccess character varying(8)
);


ALTER TABLE validationrulegroup OWNER TO dhis;

--
-- Name: validationrulegroupmembers; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE validationrulegroupmembers (
    validationgroupid integer NOT NULL,
    validationruleid integer NOT NULL
);


ALTER TABLE validationrulegroupmembers OWNER TO dhis;

--
-- Name: validationrulegrouptranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE validationrulegrouptranslations (
    validationrulegroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE validationrulegrouptranslations OWNER TO dhis;

--
-- Name: validationrulegroupusergroupaccesses; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE validationrulegroupusergroupaccesses (
    validationrulegroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


ALTER TABLE validationrulegroupusergroupaccesses OWNER TO dhis;

--
-- Name: validationrulegroupusergroupstoalert; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE validationrulegroupusergroupstoalert (
    validationgroupid integer NOT NULL,
    usergroupid integer NOT NULL
);


ALTER TABLE validationrulegroupusergroupstoalert OWNER TO dhis;

--
-- Name: validationruletranslations; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE validationruletranslations (
    validationruleid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


ALTER TABLE validationruletranslations OWNER TO dhis;

--
-- Name: version; Type: TABLE; Schema: public; Owner: dhis
--

CREATE TABLE version (
    versionid integer NOT NULL,
    versionkey character varying(230) NOT NULL,
    versionvalue character varying(255)
);


ALTER TABLE version OWNER TO dhis;

--
-- Data for Name: agencyunitusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY agencyunitusergroupaccesses (agencyunitid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: attribute; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY attribute (attributeid, uid, code, created, lastupdated, name, valuetype, mandatory, isunique, dataelementattribute, dataelementgroupattribute, indicatorattribute, indicatorgroupattribute, datasetattribute, organisationunitattribute, organisationunitgroupattribute, organisationunitgroupsetattribute, userattribute, usergroupattribute, programattribute, programstageattribute, trackedentityattribute, trackedentityattributeattribute, categoryoptionattribute, categoryoptiongroupattribute, documentattribute, optionattribute, optionsetattribute, constantattribute, legendsetattribute, programindicatorattribute, sqlviewattribute, sectionattribute, categoryoptioncomboattribute, sortorder, optionsetid) FROM stdin;
\.


--
-- Data for Name: attributetranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY attributetranslations (attributeid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: attributevalue; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY attributevalue (attributevalueid, created, lastupdated, value, attributeid) FROM stdin;
\.


--
-- Data for Name: categories_categoryoptions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categories_categoryoptions (categoryid, sort_order, categoryoptionid) FROM stdin;
13	1	12
293	1	291
293	2	292
294	1	289
294	2	290
402	1	399
402	2	400
402	3	401
523	1	521
523	2	522
\.


--
-- Data for Name: categorycombo; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categorycombo (categorycomboid, uid, code, created, lastupdated, name, datadimensiontype, skiptotal, userid, publicaccess) FROM stdin;
14	bjDvmb4bfuf	default	2017-01-27 08:36:29.018	2017-01-27 08:36:29.022	default	DISAGGREGATION	f	\N	--------
295	fMLxHJAUwcK	\N	2017-01-27 11:17:08.886	2017-01-27 11:17:08.991	JPHES Gender	DISAGGREGATION	f	46	rw------
298	iUhV2tUyB8b	\N	2017-01-27 11:17:40.43	2017-01-27 11:17:40.497	JPHES Numerator/Denominator	DISAGGREGATION	f	46	rw------
403	CSdiHUrtLck	\N	2017-01-27 11:43:39.559	2017-01-27 11:43:39.621	JPHES Malaria Through Campaigns/Facilities/Private Sector	DISAGGREGATION	f	46	rw------
524	h15uAZKMzbi	\N	2017-01-27 13:10:31.152	2017-01-27 13:10:31.194	JPHES BeMONC/CeMONC	DISAGGREGATION	f	46	rw------
\.


--
-- Data for Name: categorycombos_categories; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categorycombos_categories (categoryid, sort_order, categorycomboid) FROM stdin;
13	1	14
293	1	295
294	1	298
402	1	403
523	1	524
\.


--
-- Data for Name: categorycombos_optioncombos; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categorycombos_optioncombos (categoryoptioncomboid, categorycomboid) FROM stdin;
15	14
296	295
297	295
299	298
300	298
404	403
405	403
406	403
525	524
526	524
\.


--
-- Data for Name: categorycombotranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categorycombotranslations (categorycomboid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: categorycombousergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categorycombousergroupaccesses (categorycomboid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: categorydimension; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categorydimension (categorydimensionid, categoryid) FROM stdin;
\.


--
-- Data for Name: categorydimension_items; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categorydimension_items (categorydimensionid, sort_order, categoryoptionid) FROM stdin;
\.


--
-- Data for Name: categoryoption_organisationunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categoryoption_organisationunits (organisationunitid, categoryoptionid) FROM stdin;
\.


--
-- Data for Name: categoryoptioncombo; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categoryoptioncombo (categoryoptioncomboid, uid, code, created, lastupdated, name, ignoreapproval) FROM stdin;
15	HllvX50cXC0	default	2017-01-27 08:36:29.019	2017-01-27 08:36:29.02	default	f
296	Evq43lpHFBO	\N	2017-01-27 11:17:08.97	2017-01-27 11:17:08.983	Male	f
297	zHSeMiszM8b	\N	2017-01-27 11:17:08.986	2017-01-27 11:17:08.987	Female	f
299	IhtLhkHwYrQ	\N	2017-01-27 11:17:40.492	2017-01-27 11:17:40.493	Numerator	f
300	G9dsIX6YwR6	\N	2017-01-27 11:17:40.494	2017-01-27 11:17:40.495	Denominator	f
404	s3wXi7AxrqM	\N	2017-01-27 11:43:39.612	2017-01-27 11:43:39.612	Through campaigns	f
405	nozAOHqLOkI	\N	2017-01-27 11:43:39.614	2017-01-27 11:43:39.614	Through health facilities	f
406	ZM7SBqwEmUZ	\N	2017-01-27 11:43:39.619	2017-01-27 11:43:39.62	Through the private/commercial sector	f
525	I0q6bcGoQjP	\N	2017-01-27 13:10:31.19	2017-01-27 13:10:31.19	BeMONC	f
526	rcYc8tKldbt	\N	2017-01-27 13:10:31.192	2017-01-27 13:10:31.192	CeMONC	f
\.


--
-- Data for Name: categoryoptioncomboattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categoryoptioncomboattributevalues (categoryoptioncomboid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: categoryoptioncombos_categoryoptions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categoryoptioncombos_categoryoptions (categoryoptionid, categoryoptioncomboid) FROM stdin;
12	15
291	296
292	297
289	299
290	300
399	404
400	405
401	406
521	525
522	526
\.


--
-- Data for Name: categoryoptioncombotranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categoryoptioncombotranslations (categoryoptioncomboid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroup; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categoryoptiongroup (categoryoptiongroupid, uid, code, created, lastupdated, name, shortname, datadimensiontype, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categoryoptiongroupattributevalues (categoryoptiongroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categoryoptiongroupmembers (categoryoptiongroupid, categoryoptionid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categoryoptiongroupset (categoryoptiongroupsetid, uid, code, created, lastupdated, name, description, datadimension, datadimensiontype, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupsetmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categoryoptiongroupsetmembers (categoryoptiongroupid, categoryoptiongroupsetid, sort_order) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupsettranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categoryoptiongroupsettranslations (categoryoptiongroupsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categoryoptiongroupsetusergroupaccesses (categoryoptiongroupsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongrouptranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categoryoptiongrouptranslations (categoryoptiongroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categoryoptiongroupusergroupaccesses (categoryoptiongroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: categoryoptiontranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY categoryoptiontranslations (categoryoptionid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: chart; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY chart (chartid, uid, code, created, lastupdated, name, description, domainaxislabel, rangeaxislabel, type, series, category, hidelegend, regressiontype, hidetitle, hidesubtitle, targetlinevalue, targetlinelabel, baselinevalue, baselinelabel, relativeperiodsid, userorganisationunit, userorganisationunitchildren, userorganisationunitgrandchildren, aggregationtype, completedonly, title, showdata, hideemptyrows, rangeaxismaxvalue, rangeaxisminvalue, rangeaxissteps, rangeaxisdecimals, sortorder, externalaccess, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: chart_categorydimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY chart_categorydimensions (chartid, sort_order, categorydimensionid) FROM stdin;
\.


--
-- Data for Name: chart_categoryoptiongroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY chart_categoryoptiongroups (chartid, sort_order, categoryoptiongroupid) FROM stdin;
\.


--
-- Data for Name: chart_datadimensionitems; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY chart_datadimensionitems (chartid, sort_order, datadimensionitemid) FROM stdin;
\.


--
-- Data for Name: chart_dataelementgroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY chart_dataelementgroups (chartid, sort_order, dataelementgroupid) FROM stdin;
\.


--
-- Data for Name: chart_filters; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY chart_filters (chartid, sort_order, filter) FROM stdin;
\.


--
-- Data for Name: chart_itemorgunitgroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY chart_itemorgunitgroups (chartid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: chart_organisationunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY chart_organisationunits (chartid, sort_order, organisationunitid) FROM stdin;
\.


--
-- Data for Name: chart_orgunitgroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY chart_orgunitgroups (chartid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: chart_orgunitlevels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY chart_orgunitlevels (chartid, sort_order, orgunitlevel) FROM stdin;
\.


--
-- Data for Name: chart_periods; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY chart_periods (chartid, sort_order, periodid) FROM stdin;
\.


--
-- Data for Name: charttranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY charttranslations (chartid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: chartusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY chartusergroupaccesses (chartid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: color; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY color (colorid, uid, code, created, lastupdated, name, color) FROM stdin;
\.


--
-- Data for Name: colorset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY colorset (colorsetid, uid, code, created, lastupdated, name) FROM stdin;
\.


--
-- Data for Name: colorset_colors; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY colorset_colors (colorsetid, sort_order, colorid) FROM stdin;
\.


--
-- Data for Name: colorsettranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY colorsettranslations (colorsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: colortranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY colortranslations (colorid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: completedatasetregistration; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY completedatasetregistration (datasetid, periodid, sourceid, attributeoptioncomboid, date, storedby) FROM stdin;
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY configuration (configurationid, systemid, feedbackrecipientsid, offlineorgunitlevelid, infrastructuralindicatorsid, infrastructuraldataelementsid, infrastructuralperiodtypeid, selfregistrationrole, selfregistrationorgunit) FROM stdin;
17	dd78641b-e40d-41cd-904a-2e6fd8a88ef7	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: configuration_corswhitelist; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY configuration_corswhitelist (configurationid, corswhitelist) FROM stdin;
\.


--
-- Data for Name: constant; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY constant (constantid, uid, code, created, lastupdated, name, shortname, description, value, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: constantattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY constantattributevalues (constantid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: constanttranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY constanttranslations (colorid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: constantusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY constantusergroupaccesses (constantid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dashboard; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dashboard (dashboardid, uid, code, created, lastupdated, name, userid, externalaccess, publicaccess) FROM stdin;
\.


--
-- Data for Name: dashboard_items; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dashboard_items (dashboardid, sort_order, dashboarditemid) FROM stdin;
\.


--
-- Data for Name: dashboarditem; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dashboarditem (dashboarditemid, uid, code, created, lastupdated, chartid, eventchartid, mapid, reporttable, eventreport, messages, appkey, shape) FROM stdin;
\.


--
-- Data for Name: dashboarditem_reports; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dashboarditem_reports (dashboarditemid, sort_order, reportid) FROM stdin;
\.


--
-- Data for Name: dashboarditem_resources; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dashboarditem_resources (dashboarditemid, sort_order, resourceid) FROM stdin;
\.


--
-- Data for Name: dashboarditem_users; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dashboarditem_users (dashboarditemid, sort_order, userid) FROM stdin;
\.


--
-- Data for Name: dashboarditemtranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dashboarditemtranslations (dashboarditemid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dashboardtranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dashboardtranslations (dashboardid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dashboardusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dashboardusergroupaccesses (dashboardid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataapproval; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataapproval (dataapprovalid, dataapprovallevelid, workflowid, periodid, organisationunitid, attributeoptioncomboid, accepted, created, creator) FROM stdin;
\.


--
-- Data for Name: dataapprovallevel; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataapprovallevel (dataapprovallevelid, uid, code, created, lastupdated, name, level, orgunitlevel, categoryoptiongroupsetid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: dataapprovalleveltranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataapprovalleveltranslations (dataapprovallevelid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataapprovallevelusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataapprovallevelusergroupaccesses (dataapprovallevelid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataapprovalworkflow; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataapprovalworkflow (workflowid, uid, code, created, lastupdated, name, periodtypeid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: dataapprovalworkflowlevels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataapprovalworkflowlevels (workflowid, dataapprovallevelid) FROM stdin;
\.


--
-- Data for Name: dataapprovalworkflowtranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataapprovalworkflowtranslations (workflowid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataapprovalworkflowusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataapprovalworkflowusergroupaccesses (workflowid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: datadimensionitem; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY datadimensionitem (datadimensionitemid, indicatorid, dataelementid, dataelementoperandid, datasetid, metric, programindicatorid, programdataelementid, programattributeid) FROM stdin;
\.


--
-- Data for Name: dataelement; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelement (dataelementid, uid, code, created, lastupdated, name, shortname, description, formname, valuetype, domaintype, aggregationtype, categorycomboid, url, zeroissignificant, optionsetid, commentoptionsetid, legendsetid, userid, publicaccess) FROM stdin;
52	Iz357ps1KKa	\N	2017-01-27 10:09:45.656	2017-01-27 17:05:27.949	Training_Performance-Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	Training-Custom: Total number of CHWs trained in	Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
50	pIEepIJkZxM	\N	2017-01-27 10:09:45.656	2017-01-27 17:05:42.654	Training_Performance-Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	Training-Custom: Total number of Community Health	Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
53	oXdh3orGb6V	\N	2017-01-27 10:09:45.656	2017-01-27 17:05:55.669	Training_Performance-Custom: Total number of health workers trained in commodity management through USG supported programs	Training-Custom: Total number of health workers	Custom: Total number of health workers trained in commodity management through USG supported programs	Custom: Total number of health workers trained in commodity management through USG supported programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
51	KYOenT42vIX	\N	2017-01-27 10:09:45.656	2017-01-27 17:06:05.593	Training_Performance-Custom: Total number of health workers trained in FP/RH through in-service training	Training-Custom: Total number of health workers t	Custom: Total number of health workers trained in FP/RH through in-service training	Custom: Total number of health workers trained in FP/RH through in-service training	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
63	ssuYEerQOvu	\N	2017-01-27 10:09:45.657	2017-01-27 17:06:32.502	Training_Performance-H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	Training-H2.2.D: Number of community health and p	H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
61	doe1BiQQ7je	\N	2017-01-27 10:09:45.657	2017-01-27 17:07:18.707	Training_Performance-Number of individuals trained to implement improved sanitation methods	Training-Number of individuals trained to impleme	Number of individuals trained to implement improved sanitation methods	Number of individuals trained to implement improved sanitation methods	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
57	SlzLZlX6idE	\N	2017-01-27 10:09:45.656	2017-01-27 17:07:29.821	Training_Performance-Number of people trained in child health care and nutrition through USG-supported health area programs	Training-Number of people trained in child health	Number of people trained in child health care and nutrition through USG-supported health area programs	Number of people trained in child health care and nutrition through USG-supported health area programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
60	ExaxTDDCrlv	\N	2017-01-27 10:09:45.657	2017-01-27 17:07:41.073	Training_Performance-Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	Training-Number of people trained in Family Plann	Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
59	ugBEsOsXXyP	\N	2017-01-27 10:09:45.657	2017-01-27 17:07:54.799	Training_Performance-Number of people trained in FP/RH with USG funds	Training-Number of people trained in FP/RH with U	Number of people trained in FP/RH with USG funds	Number of people trained in FP/RH with USG funds	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
55	gXj3q9OhwyW	\N	2017-01-27 10:09:45.656	2017-01-27 17:08:07.835	Training_Performance-Number of people trained in Malaria monitoring and evaluation with USG assistance	Training-Number of people trained in Malaria moni	Number of people trained in Malaria monitoring and evaluation with USG assistance	Number of people trained in Malaria monitoring and evaluation with USG assistance	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
54	WLius6ciXLA	\N	2017-01-27 10:09:45.656	2017-01-27 17:08:20.586	Training_Performance-Number of people trained in malaria treatment or prevention	Training-Number of people trained in malaria trea	Number of people trained in malaria treatment or prevention	Number of people trained in malaria treatment or prevention	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
58	BdODm3EDRVG	\N	2017-01-27 10:09:45.657	2017-01-27 17:08:41.938	Training_Performance-Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	Training-Number of people trained in Maternal and	Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
56	sPtMkz7edyy	\N	2017-01-27 10:09:45.656	2017-01-27 17:08:54.027	Training_Performance-Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	Training-Number of people trained in maternal and	Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
62	Kpku2CRlkIi	\N	2017-01-27 10:09:45.657	2017-01-27 17:09:06.003	Training_Performance-Nutrition: Number of Community health workers trained in child health and/or nutrition	Training-Nutrition: Number of Community health wo	Nutrition: Number of Community health workers trained in child health and/or nutrition	Nutrition: Number of Community health workers trained in child health and/or nutrition	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
48	QBowB3USu4E	\N	2017-01-27 10:09:45.655	2017-01-27 17:09:24.53	Training_Performance-Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	Training-Standard: 3.1.9-1 Number of people train	Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
68	wa1Vr4HYRhL	\N	2017-01-27 10:09:45.658	2017-01-27 10:09:45.74	Training_Cadre-Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	Training_Cadre-Standard: 3.1.9-1 Number of people	Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
69	qlGWKNFID1E	\N	2017-01-27 10:09:45.658	2017-01-27 10:09:45.74	Training_Cadre-Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	Training_Cadre-Custom: Number of health service p	Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
70	UZ4tA5SMd16	\N	2017-01-27 10:09:45.658	2017-01-27 10:09:45.74	Training_Cadre-Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	Training_Cadre-Custom: Total number of Community	Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
71	l7j9KgHhfes	\N	2017-01-27 10:09:45.658	2017-01-27 10:09:45.74	Training_Cadre-Custom: Total number of health workers trained in FP/RH through in-service training	Training_Cadre-Custom: Total number of health wor	Custom: Total number of health workers trained in FP/RH through in-service training	Custom: Total number of health workers trained in FP/RH through in-service training	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
72	tHovSR0Sna9	\N	2017-01-27 10:09:45.659	2017-01-27 10:09:45.74	Training_Cadre-Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	Training_Cadre-Custom: Total number of CHWs train	Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
73	oHodhC7abPr	\N	2017-01-27 10:09:45.659	2017-01-27 10:09:45.74	Training_Cadre-Custom: Total number of health workers trained in commodity management through USG supported programs	Training_Cadre-Custom: Total number of health wo	Custom: Total number of health workers trained in commodity management through USG supported programs	Custom: Total number of health workers trained in commodity management through USG supported programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
74	qbIEMdqX6SC	\N	2017-01-27 10:09:45.659	2017-01-27 10:09:45.74	Training_Cadre-Number of people trained in malaria treatment or prevention	Training_Cadre-Number of people trained in m	Number of people trained in malaria treatment or prevention	Number of people trained in malaria treatment or prevention	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
75	AxGOLjw4C0e	\N	2017-01-27 10:09:45.659	2017-01-27 10:09:45.74	Training_Cadre-Number of people trained in Malaria monitoring and evaluation with USG assistance	Training_Cadre-Number of people trained in Malari	Number of people trained in Malaria monitoring and evaluation with USG assistance	Number of people trained in Malaria monitoring and evaluation with USG assistance	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
76	VIzB80nnqCk	\N	2017-01-27 10:09:45.659	2017-01-27 10:09:45.74	Training_Cadre-Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	Training_Cadre-Number of people trained in matern	Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
77	vAIDHV0jv7o	\N	2017-01-27 10:09:45.659	2017-01-27 10:09:45.74	Training_Cadre-Number of people trained in child health care and nutrition through USG-supported health area programs	Training_Cadre-Number of people trained in child	Number of people trained in child health care and nutrition through USG-supported health area programs	Number of people trained in child health care and nutrition through USG-supported health area programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
78	U2sQqGUYnwO	\N	2017-01-27 10:09:45.659	2017-01-27 10:09:45.74	Training_Cadre-Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	Training_Cadre-Number of people trained in Matern	Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
79	ejs9QXdm5R6	\N	2017-01-27 10:09:45.659	2017-01-27 10:09:45.74	Training_Cadre-Number of people trained in FP/RH with USG funds	Training_Cadre-Number of people trained in FP/RH	Number of people trained in FP/RH with USG funds	Number of people trained in FP/RH with USG funds	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
64	GZCTmtVMyGr	\N	2017-01-27 10:09:45.657	2017-01-27 17:06:44.458	Training_Performance-H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	Training-H2.3.DMC: Number of health care workers	H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
66	vzOcibT8QzW	\N	2017-01-27 10:09:45.658	2017-01-27 17:06:55.132	Training_Performance-H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	Training-H2.3.D: Number of health care workers wh	H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
65	E7PVXbISFt6	\N	2017-01-27 10:09:45.657	2017-01-27 17:07:07.464	Training_Performance-H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	Training-H2.3.DPT: Number of health care workers	H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
80	wW6HfUiVxHr	\N	2017-01-27 10:09:45.659	2017-01-27 10:09:45.74	Training_Cadre-Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	Training_Cadre-Number of people trained in Family	Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
81	harLw7cj0Il	\N	2017-01-27 10:09:45.659	2017-01-27 10:09:45.74	Training_Cadre-Number of individuals trained to implement improved sanitation methods	Training_Cadre-Number of individuals trained to i	Number of individuals trained to implement improved sanitation methods	Number of individuals trained to implement improved sanitation methods	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
82	QbRZ3AmYyMd	\N	2017-01-27 10:09:45.66	2017-01-27 10:09:45.74	Training_Cadre-Nutrition: Number of Community health workers trained in child health and/or nutrition	Training_Cadre-Nutrition: Number of Community hea	Nutrition: Number of Community health workers trained in child health and/or nutrition	Nutrition: Number of Community health workers trained in child health and/or nutrition	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
83	g0djjCN1opI	\N	2017-01-27 10:09:45.66	2017-01-27 10:09:45.74	Training_Cadre-H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	Training_Cadre-H2.2.D: Number of community health	H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
84	RpgQFVll9kU	\N	2017-01-27 10:09:45.66	2017-01-27 10:09:45.74	Training_Cadre-H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	Training_Cadre-H2.3.DMC: Number of health care wo	H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
85	z1rxPgSBQqb	\N	2017-01-27 10:09:45.66	2017-01-27 10:09:45.74	Training_Cadre-H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	Training_Cadre-H2.3.DPT: Number of health care wo	H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
86	gbUCXsRatgH	\N	2017-01-27 10:09:45.66	2017-01-27 10:09:45.74	Training_Cadre-H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	Training_Cadre-H2.3.D: Number of health care work	H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
87	bfV72a0BbvN	\N	2017-01-27 10:09:45.66	2017-01-27 10:09:45.74	Training_Cadre-H2.1D: Number of new health care workers who graduated from a pre‐service training institution	Training_Cadre-H2.1D: Number of new health care w	H2.1D: Number of new health care workers who graduated from a pre‐service training institution	H2.1D: Number of new health care workers who graduated from a pre‐service training institution	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
88	CP2L0EdVfYZ	\N	2017-01-27 10:09:45.66	2017-01-27 10:09:45.74	Training_Curriculum-Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	Training_Curriculum-Standard: 3.1.9-1 Number of p	Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
89	Zyf69ag02Qa	\N	2017-01-27 10:09:45.661	2017-01-27 10:09:45.74	Training_Curriculum-Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	Training_Curriculum-Custom: Number of health serv	Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
90	ak257MHZ9D8	\N	2017-01-27 10:09:45.661	2017-01-27 10:09:45.74	Training_Curriculum-Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	Training_Curriculum-Custom: Total number of Commu	Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
91	pXv0QUpuuWN	\N	2017-01-27 10:09:45.661	2017-01-27 10:09:45.74	Training_Curriculum-Custom: Total number of health workers trained in FP/RH through in-service training	Training_Curriculum-Custom: Total number of healt	Custom: Total number of health workers trained in FP/RH through in-service training	Custom: Total number of health workers trained in FP/RH through in-service training	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
92	QZFtEEJsdqM	\N	2017-01-27 10:09:45.661	2017-01-27 10:09:45.74	Training_Curriculum-Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	Training_Curriculum-Custom: Total number of CHWs	Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
93	CxtnoK8xPF1	\N	2017-01-27 10:09:45.661	2017-01-27 10:09:45.74	Training_Curriculum-Custom: Total number of health workers trained in commodity management through USG supported programs	Training_Curriculum-Custom: Total number of heal	Custom: Total number of health workers trained in commodity management through USG supported programs	Custom: Total number of health workers trained in commodity management through USG supported programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
94	R9JnZvLTClm	\N	2017-01-27 10:09:45.661	2017-01-27 10:09:45.74	Training_Curriculum-Number of people trained in malaria treatment or prevention	Training_Curriculum-Number of people trained in	Number of people trained in malaria treatment or prevention	Number of people trained in malaria treatment or prevention	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
95	Jg569TtEhGz	\N	2017-01-27 10:09:45.661	2017-01-27 10:09:45.74	Training_Curriculum-Number of people trained in Malaria monitoring and evaluation with USG assistance	Training_Curriculum-Number of people trained in M	Number of people trained in Malaria monitoring and evaluation with USG assistance	Number of people trained in Malaria monitoring and evaluation with USG assistance	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
96	qF9xWbHaW6H	\N	2017-01-27 10:09:45.661	2017-01-27 10:09:45.74	Training_Curriculum-Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	Training_Curriculum-Number of people trained	Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
97	wmfCwInEHGH	\N	2017-01-27 10:09:45.661	2017-01-27 10:09:45.74	Training_Curriculum-Number of people trained in child health care and nutrition through USG-supported health area programs	Training_Curriculum-Number of people trained in c	Number of people trained in child health care and nutrition through USG-supported health area programs	Number of people trained in child health care and nutrition through USG-supported health area programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
98	u7Qi0Vs1OWl	\N	2017-01-27 10:09:45.662	2017-01-27 10:09:45.74	Training_Curriculum-Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	Training_Curriculum-Number of people traine	Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
99	VGxlSe40hWD	\N	2017-01-27 10:09:45.662	2017-01-27 10:09:45.74	Training_Curriculum-Number of people trained in FP/RH with USG funds	Training_Curriculum-Number of people trained in F	Number of people trained in FP/RH with USG funds	Number of people trained in FP/RH with USG funds	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
100	HdQLymv1zjg	\N	2017-01-27 10:09:45.662	2017-01-27 10:09:45.74	Training_Curriculum-Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	Training_Curriculum-Number of people tra	Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
101	ANijMjqsGu7	\N	2017-01-27 10:09:45.662	2017-01-27 10:09:45.74	Training_Curriculum-Number of individuals trained to implement improved sanitation methods	Training_Curriculum-Number of individuals trained	Number of individuals trained to implement improved sanitation methods	Number of individuals trained to implement improved sanitation methods	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
102	qeefDXTqSEa	\N	2017-01-27 10:09:45.662	2017-01-27 10:09:45.74	Training_Curriculum-Nutrition: Number of Community health workers trained in child health and/or nutrition	Training_Curriculum-Nutrition: Number of Communit	Nutrition: Number of Community health workers trained in child health and/or nutrition	Nutrition: Number of Community health workers trained in child health and/or nutrition	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
103	WuGTzdNP4Mv	\N	2017-01-27 10:09:45.662	2017-01-27 10:09:45.74	Training_Curriculum-H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	Training_Curriculum-H2.2.D: Number of community h	H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
104	oeB8Hgat26P	\N	2017-01-27 10:09:45.662	2017-01-27 10:09:45.74	Training_Curriculum-H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	Training_Curriculum-H2.3.DMC: Number of health ca	H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
105	iuyNlF7WImQ	\N	2017-01-27 10:09:45.662	2017-01-27 10:09:45.74	Training_Curriculum-H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	Training_Curriculum-H2.3.DPT: Number of health ca	H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
106	TlLF1LReZbm	\N	2017-01-27 10:09:45.662	2017-01-27 10:09:45.74	Training_Curriculum-H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	Training_Curriculum-H2.3.D: Number of health care	H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
107	c5qW8syVInh	\N	2017-01-27 10:09:45.663	2017-01-27 10:09:45.74	Training_Curriculum-H2.1D: Number of new health care workers who graduated from a pre‐service training institution	Training_Curriculum-H2.1D: Number of new health c	H2.1D: Number of new health care workers who graduated from a pre‐service training institution	H2.1D: Number of new health care workers who graduated from a pre‐service training institution	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
108	gqZx3dSsyDz	\N	2017-01-27 10:09:45.663	2017-01-27 10:09:45.74	Training_Days_Trained-Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	Training_Days_Trained-Standard: 3.1.9-1 Number of	Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
109	DvndGk9dQmD	\N	2017-01-27 10:09:45.663	2017-01-27 10:09:45.74	Training_Days_Trained-Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	Training_Days_Trained-Custom: Number of health se	Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
110	rEvvz5cBa6n	\N	2017-01-27 10:09:45.663	2017-01-27 10:09:45.74	Training_Days_Trained-Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	Training_Days_Trained-Custom: Total number of Com	Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
111	fLx12zonFDN	\N	2017-01-27 10:09:45.663	2017-01-27 10:09:45.74	Training_Days_Trained-Custom: Total number of health workers trained in FP/RH through in-service training	Training_Days_Trained-Custom: Total number of h	Custom: Total number of health workers trained in FP/RH through in-service training	Custom: Total number of health workers trained in FP/RH through in-service training	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
112	ejTBmc4lYFE	\N	2017-01-27 10:09:45.663	2017-01-27 10:09:45.74	Training_Days_Trained-Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	Training_Days_Trained-Custom: Total number of CHW	Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
113	LxiQNEwaDLg	\N	2017-01-27 10:09:45.663	2017-01-27 10:09:45.74	Training_Days_Trained-Custom: Total number of health workers trained in commodity management through USG supported programs	Training_Days_Trained-Custom: Total number of hea	Custom: Total number of health workers trained in commodity management through USG supported programs	Custom: Total number of health workers trained in commodity management through USG supported programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
114	wEPLHbCjtGE	\N	2017-01-27 10:09:45.663	2017-01-27 10:09:45.74	Training_Days_Trained-Number of people trained in malaria treatment or prevention	Training_Days_Trained-Number of people trained in	Number of people trained in malaria treatment or prevention	Number of people trained in malaria treatment or prevention	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
115	hVfOVIup2yk	\N	2017-01-27 10:09:45.664	2017-01-27 10:09:45.74	Training_Days_Trained-Number of people trained in Malaria monitoring and evaluation with USG assistance	Training_Days_Trained-Number of people trained i	Number of people trained in Malaria monitoring and evaluation with USG assistance	Number of people trained in Malaria monitoring and evaluation with USG assistance	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
116	GuxRscJY6hP	\N	2017-01-27 10:09:45.664	2017-01-27 10:09:45.74	Training_Days_Trained-Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	Training_Days_Trained-Number of people trained	Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
117	sTZbdHo3RRN	\N	2017-01-27 10:09:45.664	2017-01-27 10:09:45.74	Training_Days_Trained-Number of people trained in child health care and nutrition through USG-supported health area programs	Training_Days_Trained-Number of people traine	Number of people trained in child health care and nutrition through USG-supported health area programs	Number of people trained in child health care and nutrition through USG-supported health area programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
118	yCEJ3ShJnEv	\N	2017-01-27 10:09:45.664	2017-01-27 10:09:45.74	Training_Days_Trained-Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	Training_Days_Trained-Number of people train	Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
119	AeiOIfIUpct	\N	2017-01-27 10:09:45.664	2017-01-27 10:09:45.74	Training_Days_Trained-Number of people trained in FP/RH with USG funds	Training_Days_Trained-Number of people trai	Number of people trained in FP/RH with USG funds	Number of people trained in FP/RH with USG funds	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
120	ucgWJCxwjiw	\N	2017-01-27 10:09:45.664	2017-01-27 10:09:45.74	Training_Days_Trained-Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	Training_Days_Trained-Number of people tra	Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
121	aUDRATag9kU	\N	2017-01-27 10:09:45.664	2017-01-27 10:09:45.74	Training_Days_Trained-Number of individuals trained to implement improved sanitation methods	Training_Days_Trained-Number of individuals train	Number of individuals trained to implement improved sanitation methods	Number of individuals trained to implement improved sanitation methods	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
122	BtGQ7LMtsEL	\N	2017-01-27 10:09:45.664	2017-01-27 10:09:45.74	Training_Days_Trained-Nutrition: Number of Community health workers trained in child health and/or nutrition	Training_Days_Trained-Nutrition: Number of Commun	Nutrition: Number of Community health workers trained in child health and/or nutrition	Nutrition: Number of Community health workers trained in child health and/or nutrition	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
123	p5pCS0s7DJB	\N	2017-01-27 10:09:45.665	2017-01-27 10:09:45.74	Training_Days_Trained-H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	Training_Days_Trained-H2.2.D: Number of community	H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
124	ZmN3kFMZhhc	\N	2017-01-27 10:09:45.665	2017-01-27 10:09:45.74	Training_Days_Trained-H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	Training_Days_Trained-H2.3.DMC: Number of health	H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
125	fY8a5YL3OW6	\N	2017-01-27 10:09:45.665	2017-01-27 10:09:45.74	Training_Days_Trained-H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	Training_Days_Trained-H2.3.DPT: Number of health	H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
126	AG4mUXMUPIl	\N	2017-01-27 10:09:45.665	2017-01-27 10:09:45.741	Training_Days_Trained-H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	Training_Days_Trained-H2.3.D: Number of health ca	H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
127	zyTbBcreQAL	\N	2017-01-27 10:09:45.665	2017-01-27 10:09:45.741	Training_Days_Trained-H2.1D: Number of new health care workers who graduated from a pre‐service training institution	Training_Days_Trained-H2.1D: Number of new health	H2.1D: Number of new health care workers who graduated from a pre‐service training institution	H2.1D: Number of new health care workers who graduated from a pre‐service training institution	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
128	axJi3oGz5tQ	\N	2017-01-27 10:09:45.665	2017-01-27 10:09:45.741	Training_StartDate-Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	Training_StartDate-Standard: 3.1.9-1 Number of pe	Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
129	WCXPX4S0E9Y	\N	2017-01-27 10:09:45.665	2017-01-27 10:09:45.741	Training_StartDate-Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	Training_StartDate-Custom: Number of health servi	Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
130	F31woXDWk8K	\N	2017-01-27 10:09:45.665	2017-01-27 10:09:45.741	Training_StartDate-Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	Training_StartDate-Custom: Total number of Commun	Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
131	PsMjvCAiobZ	\N	2017-01-27 10:09:45.666	2017-01-27 10:09:45.741	Training_StartDate-Custom: Total number of health workers trained in FP/RH through in-service training	Training_StartDate-Custom: Total number of health	Custom: Total number of health workers trained in FP/RH through in-service training	Custom: Total number of health workers trained in FP/RH through in-service training	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
132	wugtKtXgmR4	\N	2017-01-27 10:09:45.666	2017-01-27 10:09:45.741	Training_StartDate-Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	Training_StartDate-Custom: Total number of CHWs t	Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
133	dIRBDxfD6g2	\N	2017-01-27 10:09:45.666	2017-01-27 10:09:45.741	Training_StartDate-Custom: Total number of health workers trained in commodity management through USG supported programs	Training_StartDate-Custom: Total number of heal	Custom: Total number of health workers trained in commodity management through USG supported programs	Custom: Total number of health workers trained in commodity management through USG supported programs	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
134	guqKSplwJ1f	\N	2017-01-27 10:09:45.666	2017-01-27 10:09:45.741	Training_StartDate-Number of people trained in malaria treatment or prevention	Training_StartDate-Number of people trained in ma	Number of people trained in malaria treatment or prevention	Number of people trained in malaria treatment or prevention	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
135	OpnKX6iBOpk	\N	2017-01-27 10:09:45.666	2017-01-27 10:09:45.741	Training_StartDate-Number of people trained in Malaria monitoring and evaluation with USG assistance	Training_StartDate-Number of people trained in M	Number of people trained in Malaria monitoring and evaluation with USG assistance	Number of people trained in Malaria monitoring and evaluation with USG assistance	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
136	SE2QJpLSdcJ	\N	2017-01-27 10:09:45.666	2017-01-27 10:09:45.741	Training_StartDate-Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	Training_StartDate-Number of people trained i	Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
137	AnVLIlepgFc	\N	2017-01-27 10:09:45.666	2017-01-27 10:09:45.741	Training_StartDate-Number of people trained in child health care and nutrition through USG-supported health area programs	Training_StartDate-Number of people trained in ch	Number of people trained in child health care and nutrition through USG-supported health area programs	Number of people trained in child health care and nutrition through USG-supported health area programs	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
138	bps4V2emQ1X	\N	2017-01-27 10:09:45.666	2017-01-27 10:09:45.741	Training_StartDate-Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	Training_StartDate-Number of people trained in Ma	Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
139	TMcbj8KuzCs	\N	2017-01-27 10:09:45.667	2017-01-27 10:09:45.741	Training_StartDate-Number of people trained in FP/RH with USG funds	Training_StartDate-Number of people trained in FP	Number of people trained in FP/RH with USG funds	Number of people trained in FP/RH with USG funds	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
140	EFCblXGSis7	\N	2017-01-27 10:09:45.667	2017-01-27 10:09:45.741	Training_StartDate-Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	Training_StartDate-Number of people trained in Fa	Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
141	uAmBFcuPc3c	\N	2017-01-27 10:09:45.667	2017-01-27 10:09:45.741	Training_StartDate-Number of individuals trained to implement improved sanitation methods	Training_StartDate-Number of individuals trained	Number of individuals trained to implement improved sanitation methods	Number of individuals trained to implement improved sanitation methods	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
142	Tj0u0IZncvp	\N	2017-01-27 10:09:45.667	2017-01-27 10:09:45.741	Training_StartDate-Nutrition: Number of Community health workers trained in child health and/or nutrition	Training_StartDate-Nutrition: Number of Community	Nutrition: Number of Community health workers trained in child health and/or nutrition	Nutrition: Number of Community health workers trained in child health and/or nutrition	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
143	QtaSE7ng9pA	\N	2017-01-27 10:09:45.667	2017-01-27 10:09:45.741	Training_StartDate-H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	Training_StartDate-H2.2.D: Number of community he	H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
238	G6TbhAofOJg	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	Nutrition_Target_Custom: Number of children under five who are wasted	Nutrition_Target_Custom: Number of children u	\N	Custom: Number of children under five who are wasted	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
144	za1TiT2bTU0	\N	2017-01-27 10:09:45.667	2017-01-27 10:09:45.741	Training_StartDate-H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	Training_StartDate-H2.3.DMC: Number of health car	H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
145	zz4jNq3YxyQ	\N	2017-01-27 10:09:45.667	2017-01-27 10:09:45.741	Training_StartDate-H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	Training_StartDate-H2.3.DPT: Number of health car	H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
146	ZTl9W0gsPmJ	\N	2017-01-27 10:09:45.667	2017-01-27 10:09:45.741	Training_StartDate-H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	Training_StartDate-H2.3.D: Number of health care	H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
147	VtKx3I1SDKg	\N	2017-01-27 10:09:45.668	2017-01-27 10:09:45.741	Training_StartDate-H2.1D: Number of new health care workers who graduated from a pre‐service training institution	Training_StartDate-H2.1D: Number of new health ca	H2.1D: Number of new health care workers who graduated from a pre‐service training institution	H2.1D: Number of new health care workers who graduated from a pre‐service training institution	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
148	F40LPrxGy9i	\N	2017-01-27 10:09:45.668	2017-01-27 10:09:45.741	Training_EndDate-Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	Training_EndDate-Standard: 3.1.9-1 Number of peop	Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
149	WzuOkW7VvdB	\N	2017-01-27 10:09:45.668	2017-01-27 10:09:45.741	Training_EndDate-Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	Training_EndDate-Custom: Number of health service	Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
150	GyPkQkcAHMO	\N	2017-01-27 10:09:45.668	2017-01-27 10:09:45.741	Training_EndDate-Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	Training_EndDate-Custom: Total number of Communit	Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
151	CN8drrDhGQC	\N	2017-01-27 10:09:45.668	2017-01-27 10:09:45.741	Training_EndDate-Custom: Total number of health workers trained in FP/RH through in-service training	Training_EndDate-Custom: Total number of health w	Custom: Total number of health workers trained in FP/RH through in-service training	Custom: Total number of health workers trained in FP/RH through in-service training	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
152	IUSJ3ivbDQs	\N	2017-01-27 10:09:45.668	2017-01-27 10:09:45.741	Training_EndDate-Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	Training_EndDate-Custom: Total number of CHWs tra	Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
153	KVrGaiS9EPf	\N	2017-01-27 10:09:45.668	2017-01-27 10:09:45.741	Training_EndDate-Custom: Total number of health workers trained in commodity management through USG supported programs	Training_EndDate-Custom: Total number of health	Custom: Total number of health workers trained in commodity management through USG supported programs	Custom: Total number of health workers trained in commodity management through USG supported programs	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
154	GdEpZbPzYhF	\N	2017-01-27 10:09:45.668	2017-01-27 10:09:45.741	Training_EndDate-Number of people trained in malaria treatment or prevention	Training_EndDate-Number of people trained	Number of people trained in malaria treatment or prevention	Number of people trained in malaria treatment or prevention	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
155	kbmyxoBXRZo	\N	2017-01-27 10:09:45.668	2017-01-27 10:09:45.741	Training_EndDate-Number of people trained in Malaria monitoring and evaluation with USG assistance	Training_EndDate-Number of people trained in Mala	Number of people trained in Malaria monitoring and evaluation with USG assistance	Number of people trained in Malaria monitoring and evaluation with USG assistance	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
156	cf5K8xl1xn5	\N	2017-01-27 10:09:45.669	2017-01-27 10:09:45.741	Training_EndDate-Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	Training_EndDate-Number of people trained in mate	Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
157	Mzi18XpfkhH	\N	2017-01-27 10:09:45.669	2017-01-27 10:09:45.741	Training_EndDate-Number of people trained in child health care and nutrition through USG-supported health area programs	Training_EndDate-Number of people trained in chil	Number of people trained in child health care and nutrition through USG-supported health area programs	Number of people trained in child health care and nutrition through USG-supported health area programs	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
158	ONC1VdrdDRQ	\N	2017-01-27 10:09:45.669	2017-01-27 10:09:45.741	Training_EndDate-Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	Training_EndDate-Number of people trained in	Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
159	iSNRN5gqO8B	\N	2017-01-27 10:09:45.669	2017-01-27 10:09:45.741	Training_EndDate-Number of people trained in FP/RH with USG funds	Training_EndDate-Number of people trained in FP/R	Number of people trained in FP/RH with USG funds	Number of people trained in FP/RH with USG funds	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
239	Gg5QNicshDD	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	Nutrition_Target_Custom: Number of children under five who are Underweight	Nutrition_Target_Custom: Number of children	\N	Custom: Number of children under five who are Underweight	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
160	fJITcrgepxq	\N	2017-01-27 10:09:45.669	2017-01-27 10:09:45.741	Training_EndDate-Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	Training_EndDate-Number of people trained in Fami	Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
161	nFACrUPVL6m	\N	2017-01-27 10:09:45.669	2017-01-27 10:09:45.741	Training_EndDate-Number of individuals trained to implement improved sanitation methods	Training_EndDate-Number of individuals trained to	Number of individuals trained to implement improved sanitation methods	Number of individuals trained to implement improved sanitation methods	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
162	RLveb9oGbTx	\N	2017-01-27 10:09:45.669	2017-01-27 10:09:45.741	Training_EndDate-Nutrition: Number of Community health workers trained in child health and/or nutrition	Training_EndDate-Nutrition: Number of Community h	Nutrition: Number of Community health workers trained in child health and/or nutrition	Nutrition: Number of Community health workers trained in child health and/or nutrition	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
163	G9I3ALK2ZmY	\N	2017-01-27 10:09:45.669	2017-01-27 10:09:45.741	Training_EndDate-H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	Training_EndDate-H2.2.D: Number of community heal	H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
164	nvb1vWjWlEE	\N	2017-01-27 10:09:45.67	2017-01-27 10:09:45.741	Training_EndDate-H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	Training_EndDate-H2.3.DMC: Number of health care	H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
165	w5xYBW1gVAS	\N	2017-01-27 10:09:45.67	2017-01-27 10:09:45.741	Training_EndDate-H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	Training_EndDate-H2.3.DPT: Number of health care	H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
166	TcY4OTU4xDO	\N	2017-01-27 10:09:45.67	2017-01-27 10:09:45.741	Training_EndDate-H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	Training_EndDate-H2.3.D: Number of health care wo	H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
167	xzEsJJdRcDR	\N	2017-01-27 10:09:45.67	2017-01-27 10:09:45.741	Training_EndDate-H2.1D: Number of new health care workers who graduated from a pre‐service training institution	Training_EndDate-H2.1D: Number of new health care	H2.1D: Number of new health care workers who graduated from a pre‐service training institution	H2.1D: Number of new health care workers who graduated from a pre‐service training institution	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
168	Da9uye953gE	\N	2017-01-27 10:09:45.67	2017-01-27 10:09:45.741	Training_Narrative-Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	Training_Narrative-Standard: 3.1.9-1 Number of pe	Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	Standard: 3.1.9-1 Number of people trained in child health care and nutrition through USG-supported health area programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
169	gv0OUl0eKwZ	\N	2017-01-27 10:09:45.67	2017-01-27 10:09:45.741	Training_Narrative-Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	Training_Narrative-Custom: Number of health servi	Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
170	GI5xfHrUqGB	\N	2017-01-27 10:09:45.67	2017-01-27 10:09:45.741	Training_Narrative-Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	Training_Narrative-Custom: Total number of Commun	Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
171	Mtwe9SzJg11	\N	2017-01-27 10:09:45.67	2017-01-27 10:09:45.741	Training_Narrative-Custom: Total number of health workers trained in FP/RH through in-service training	Training_Narrative-Custom: Total number of healt	Custom: Total number of health workers trained in FP/RH through in-service training	Custom: Total number of health workers trained in FP/RH through in-service training	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
172	V5EY1Yz9VWS	\N	2017-01-27 10:09:45.671	2017-01-27 10:09:45.741	Training_Narrative-Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	Training_Narrative-Custom: Total number of CHWs t	Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	Custom: Total number of CHWs trained in family planning counselling services through USG supported programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
173	mmaxpstsbDW	\N	2017-01-27 10:09:45.671	2017-01-27 10:09:45.741	Training_Narrative-Custom: Total number of health workers trained in commodity management through USG supported programs	Training_Narrative-Custom: Total number of health	Custom: Total number of health workers trained in commodity management through USG supported programs	Custom: Total number of health workers trained in commodity management through USG supported programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
174	w9ENmdRIGfK	\N	2017-01-27 10:09:45.671	2017-01-27 10:09:45.741	Training_Narrative-Number of people trained in malaria treatment or prevention	Training_Narrative-Number of people trained in	Number of people trained in malaria treatment or prevention	Number of people trained in malaria treatment or prevention	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
175	duFD1sb1djC	\N	2017-01-27 10:09:45.671	2017-01-27 10:09:45.741	Training_Narrative-Number of people trained in Malaria monitoring and evaluation with USG assistance	Training_Narrative-Number of people trai	Number of people trained in Malaria monitoring and evaluation with USG assistance	Number of people trained in Malaria monitoring and evaluation with USG assistance	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
176	zdKpP0nVubN	\N	2017-01-27 10:09:45.671	2017-01-27 10:09:45.741	Training_Narrative-Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	Training_Narrative-Number of people trained in ma	Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	Number of people trained in maternal and/or newborn health and nutrition care through USG-supported pro	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
177	XfGmkfl59Gw	\N	2017-01-27 10:09:45.671	2017-01-27 10:09:45.741	Training_Narrative-Number of people trained in child health care and nutrition through USG-supported health area programs	Training_Narrative-Number of people trained in ch	Number of people trained in child health care and nutrition through USG-supported health area programs	Number of people trained in child health care and nutrition through USG-supported health area programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
178	zQbYWDaNw3e	\N	2017-01-27 10:09:45.671	2017-01-27 10:09:45.741	Training_Narrative-Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	Training_Narrative-Number of people trained in M	Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
179	OLgOjjtvE8U	\N	2017-01-27 10:09:45.671	2017-01-27 10:09:45.741	Training_Narrative-Number of people trained in FP/RH with USG funds	Training_Narrative-Number of people trained in FP	Number of people trained in FP/RH with USG funds	Number of people trained in FP/RH with USG funds	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
180	m9KKfM5A5Qs	\N	2017-01-27 10:09:45.671	2017-01-27 10:09:45.741	Training_Narrative-Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	Training_Narrative-Number of people trained in Fa	Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
181	aTBVOlhbUpA	\N	2017-01-27 10:09:45.671	2017-01-27 10:09:45.741	Training_Narrative-Number of individuals trained to implement improved sanitation methods	Training_Narrative-Number of individuals trained	Number of individuals trained to implement improved sanitation methods	Number of individuals trained to implement improved sanitation methods	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
182	NAZFcpl01yH	\N	2017-01-27 10:09:45.672	2017-01-27 10:09:45.741	Training_Narrative-Nutrition: Number of Community health workers trained in child health and/or nutrition	Training_Narrative-Nutrition: Number of Community	Nutrition: Number of Community health workers trained in child health and/or nutrition	Nutrition: Number of Community health workers trained in child health and/or nutrition	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
183	iBu3DhYr92Y	\N	2017-01-27 10:09:45.672	2017-01-27 10:09:45.741	Training_Narrative-H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	Training_Narrative-H2.2.D: Number of community he	H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
184	KjZpwmnEab2	\N	2017-01-27 10:09:45.672	2017-01-27 10:09:45.741	Training_Narrative-H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	Training_Narrative-H2.3.DMC: Number of health car	H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
185	slWG1x3wtyT	\N	2017-01-27 10:09:45.672	2017-01-27 10:09:45.741	Training_Narrative-H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	Training_Narrative-H2.3.DPT: Number of health car	H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
186	akzXrr1WpJb	\N	2017-01-27 10:09:45.672	2017-01-27 10:09:45.741	Training_Narrative-H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	Training_Narrative-H2.3.D: Number of health care	H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
187	hDI9o8Z5U76	\N	2017-01-27 10:09:45.672	2017-01-27 10:09:45.741	Training_Narrative-H2.1D: Number of new health care workers who graduated from a pre‐service training institution	Training_Narrative-H2.1D: Number of new health ca	H2.1D: Number of new health care workers who graduated from a pre‐service training institution	H2.1D: Number of new health care workers who graduated from a pre‐service training institution	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
188	AjQLlfjNZL6	\N	2017-01-27 10:14:08.647	2017-01-27 10:14:08.695	FPRH_Target-Standard: 3.1.7.1-1 Couple-years of protection (CYP) in USG-supported programs	FPRH_Target-Standard: 3.1.7.1-1 Couple-years of p	Standard: 3.1.7.1-1 Couple-years of protection (CYP) in USG-supported programs	Standard: 3.1.7.1-1 Couple-years of protection (CYP) in USG-supported programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
190	zo6UW9Ou6ak	\N	2017-01-27 10:14:08.648	2017-01-27 10:14:08.695	FPRH_Target-Standard: 3.1.7.1-4 Number of additional USG-assisted community health workers (CHWs) providing family planning (FP) information:	FPRH_Target-Standard: 3.1.7.1-4 Number of additio	Standard: 3.1.7.1-4 Number of additional USG-assisted community health workers (CHWs) providing family planning (FP) information:	Standard: 3.1.7.1-4 Number of additional USG-assisted community health workers (CHWs) providing family planning (FP) information:	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
240	ST9KsMP3aOy	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	Nutrition_Target_Standard: 3.1.9.2-2 Number of health facilities with established capacity to manage acute under-nutrition	Nutrition_Target_Standard: 3.1.9.2-2 Number o	\N	Standard: 3.1.9.2-2 Number of health facilities with established capacity to manage acute under-nutrition	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
191	Kg46HxvJBRG	\N	2017-01-27 10:14:08.648	2017-01-27 10:14:08.695	FPRH_Target-Custom: Number of new policies developed with USG assistance to improve access and use of FP/RH, MCH and Nutrition services, by stage of development:	FPRH_Target-Custom: Number of new policies develo	Custom: Number of new policies developed with USG assistance to improve access and use of FP/RH, MCH and Nutrition services, by stage of development:	Custom: Number of new policies developed with USG assistance to improve access and use of FP/RH, MCH and Nutrition services, by stage of development:	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
192	Mdkd9fMQ5Hs	\N	2017-01-27 10:14:08.648	2017-01-27 10:14:08.695	FPRH_Target-Custom: Number of new Guidelines or Strategic Plans developed with USG assistance to improve access to and use of FP/RH:	FPRH_Target-Custom: Number of new Guidelines or S	Custom: Number of new Guidelines or Strategic Plans developed with USG assistance to improve access to and use of FP/RH:	Custom: Number of new Guidelines or Strategic Plans developed with USG assistance to improve access to and use of FP/RH:	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
193	LtvUWDeywUM	\N	2017-01-27 10:14:08.648	2017-01-27 10:14:08.695	FPRH_Target-Custom: Number of policies or guidelines developed or changed to improve access to and use of FP/RH services :	FPRH_Target-Custom: Number of policies or guideli	Custom: Number of policies or guidelines developed or changed to improve access to and use of FP/RH services :	Custom: Number of policies or guidelines developed or changed to improve access to and use of FP/RH services :	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
194	NIZxsTaJLNy	\N	2017-01-27 10:14:08.648	2017-01-27 10:14:08.695	FPRH_Target-Custom: Percent increase on contraceptive commodity reporting rates	FPRH_Target-Custom: Percent increase on contracep	Custom: Percent increase on contraceptive commodity reporting rates	Custom: Percent increase on contraceptive commodity reporting rates	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
195	fFHrUCoF1dG	\N	2017-01-27 10:14:08.648	2017-01-27 10:14:08.695	FPRH_Performance-Standard: 3.1.7.1-1 Couple-years of protection (CYP) in USG-supported programs	FPRH_Performance-Standard: 3.1.7.1-1 Couple-years	Standard: 3.1.7.1-1 Couple-years of protection (CYP) in USG-supported programs	Standard: 3.1.7.1-1 Couple-years of protection (CYP) in USG-supported programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
197	XEVaFYluMsT	\N	2017-01-27 10:14:08.648	2017-01-27 10:14:08.695	FPRH_Performance-Standard: 3.1.7.1-4 Number of additional USG-assisted community health workers (CHWs) providing family planning (FP) information:	FPRH_Performance-Standard: 3.1.7.1-4 Number of ad	Standard: 3.1.7.1-4 Number of additional USG-assisted community health workers (CHWs) providing family planning (FP) information:	Standard: 3.1.7.1-4 Number of additional USG-assisted community health workers (CHWs) providing family planning (FP) information:	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
198	Ip5yoU6shDQ	\N	2017-01-27 10:14:08.648	2017-01-27 10:14:08.695	FPRH_Performance-Custom: Number of new policies developed with USG assistance to improve access and use of FP/RH, MCH and Nutrition services, by stage of development:	FPRH_Performance-Custom: Number of new policies d	Custom: Number of new policies developed with USG assistance to improve access and use of FP/RH, MCH and Nutrition services, by stage of development:	Custom: Number of new policies developed with USG assistance to improve access and use of FP/RH, MCH and Nutrition services, by stage of development:	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
199	LO82gr1TWLO	\N	2017-01-27 10:14:08.648	2017-01-27 10:14:08.695	FPRH_Performance-Custom: Number of new Guidelines or Strategic Plans developed with USG assistance to improve access to and use of FP/RH:	FPRH_Performance-Custom: Number of new Guidelines	Custom: Number of new Guidelines or Strategic Plans developed with USG assistance to improve access to and use of FP/RH:	Custom: Number of new Guidelines or Strategic Plans developed with USG assistance to improve access to and use of FP/RH:	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
200	OdOuVJFLPcX	\N	2017-01-27 10:14:08.648	2017-01-27 10:14:08.696	FPRH_Performance-Custom: Number of policies or guidelines developed or changed to improve access to and use of FP/RH services :	FPRH_Performance-Custom: Number of policies or gu	Custom: Number of policies or guidelines developed or changed to improve access to and use of FP/RH services :	Custom: Number of policies or guidelines developed or changed to improve access to and use of FP/RH services :	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
201	KBBqoa2QB7C	\N	2017-01-27 10:14:08.648	2017-01-27 10:14:08.696	FPRH_Performance-Custom: Percent increase on contraceptive commodity reporting rates	FPRH_Performance-Custom: Percent increase on cont	Custom: Percent increase on contraceptive commodity reporting rates	Custom: Percent increase on contraceptive commodity reporting rates	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
202	C0DWzot17Xy	\N	2017-01-27 10:14:08.648	2017-01-27 10:14:08.696	FPRH_Narrative-Standard: 3.1.7.1-1 Couple-years of protection (CYP) in USG-supported programs	FPRH_Narrative-Standard: 3.1.7.1-1 Couple-years o	Standard: 3.1.7.1-1 Couple-years of protection (CYP) in USG-supported programs	Standard: 3.1.7.1-1 Couple-years of protection (CYP) in USG-supported programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
203	ucjHtFFfjEZ	\N	2017-01-27 10:14:08.648	2017-01-27 10:14:08.696	FPRH_Narrative-Standard: 3.1.7.1-2 Percent of service delivery points (SDP) that experience stock out at any time during the reporting period of a contraceptive method that the SDP is expected to provide:	FPRH_Narrative-Standard: 3.1.7.1-2 Percent of ser	Standard: 3.1.7.1-2 Percent of service delivery points (SDP) that experience stock out at any time during the reporting period of a contraceptive method that the SDP is expected to provide:	Standard: 3.1.7.1-2 Percent of service delivery points (SDP) that experience stock out at any time during the reporting period of a contraceptive method that the SDP is expected to provide:	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
204	e2MAgb5u6Su	\N	2017-01-27 10:14:08.648	2017-01-27 10:14:08.696	FPRH_Narrative-Standard: 3.1.7.1-4 Number of additional USG-assisted community health workers (CHWs) providing family planning (FP) information:	FPRH_Narrative-Standard: 3.1.7.1-4 Number of addi	Standard: 3.1.7.1-4 Number of additional USG-assisted community health workers (CHWs) providing family planning (FP) information:	Standard: 3.1.7.1-4 Number of additional USG-assisted community health workers (CHWs) providing family planning (FP) information:	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
205	FWWoDxKlXRg	\N	2017-01-27 10:14:08.648	2017-01-27 10:14:08.696	FPRH_Narrative-Custom: Number of new policies developed with USG assistance to improve access and use of FP/RH, MCH and Nutrition services, by stage of development:	FPRH_Narrative-Custom: Number of new policies dev	Custom: Number of new policies developed with USG assistance to improve access and use of FP/RH, MCH and Nutrition services, by stage of development:	Custom: Number of new policies developed with USG assistance to improve access and use of FP/RH, MCH and Nutrition services, by stage of development:	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
206	RXwOwGXICBe	\N	2017-01-27 10:14:08.648	2017-01-27 10:14:08.696	FPRH_Narrative-Custom: Number of new Guidelines or Strategic Plans developed with USG assistance to improve access to and use of FP/RH:	FPRH_Narrative-Custom: Number of new Guidelines o	Custom: Number of new Guidelines or Strategic Plans developed with USG assistance to improve access to and use of FP/RH:	Custom: Number of new Guidelines or Strategic Plans developed with USG assistance to improve access to and use of FP/RH:	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
207	a5JH70aUwTP	\N	2017-01-27 10:14:08.648	2017-01-27 10:14:08.696	FPRH_Narrative-Custom: Number of policies or guidelines developed or changed to improve access to and use of FP/RH services :	FPRH_Narrative-Custom: Number of policies or guid	Custom: Number of policies or guidelines developed or changed to improve access to and use of FP/RH services :	Custom: Number of policies or guidelines developed or changed to improve access to and use of FP/RH services :	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
208	nIxIY6oXZz0	\N	2017-01-27 10:14:08.648	2017-01-27 10:14:08.696	FPRH_Narrative-Custom: Percent increase on contraceptive commodity reporting rates	FPRH_Narrative-Custom: Percent increase on contra	Custom: Percent increase on contraceptive commodity reporting rates	Custom: Percent increase on contraceptive commodity reporting rates	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
211	UO6pD5QxzOi	\N	2017-01-27 10:14:08.649	2017-01-27 10:14:08.696	WASH_Target-Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings	WASH_Target-Standard: 3.1.8.2-3 Number of improve	Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings	Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
212	LFedJLGIqkN	\N	2017-01-27 10:14:08.649	2017-01-27 10:14:08.696	WASH_Target-Standard: 3.1.6.8-5 Number of communities certified as -open defecation free- as a result of USG assistance	WASH_Target-Standard: 3.1.6.8-5 Number of communi	Standard: 3.1.6.8-5 Number of communities certified as -open defecation free- as a result of USG assistance	Standard: 3.1.6.8-5 Number of communities certified as -open defecation free- as a result of USG assistance	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
213	siwS1HZGgVr	\N	2017-01-27 10:14:08.649	2017-01-27 10:14:08.696	WASH_Target-Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products	WASH_Target-Standard: 3.1.6.8-4 Number of liters	Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products	Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
215	WS4omFo1DgY	\N	2017-01-27 10:14:08.649	2017-01-27 10:14:08.696	WASH_Target-Custom: Number of individuals trained to implement improved sanitation methods	WASH_Target-Custom: Number of individuals trained	Custom: Number of individuals trained to implement improved sanitation methods	Custom: Number of individuals trained to implement improved sanitation methods	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
218	JxrzCSuNroP	\N	2017-01-27 10:14:08.649	2017-01-27 10:14:08.696	WASH_Performance-Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings	WASH_Performance-Standard: 3.1.8.2-3 Number of im	Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings	Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
219	jDOCGV6pDJp	\N	2017-01-27 10:14:08.649	2017-01-27 10:14:08.696	WASH_Performance-Standard: 3.1.6.8-5 Number of communities certified as -open defecation free- as a result of USG assistance	WASH_Performance-Standard: 3.1.6.8-5 Number of co	Standard: 3.1.6.8-5 Number of communities certified as -open defecation free- as a result of USG assistance	Standard: 3.1.6.8-5 Number of communities certified as -open defecation free- as a result of USG assistance	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
261	e9oWASlQzt9	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Target_Custom: Number of women who had a live birth in the same specified period	MCH_Target_Custom: Number of women who had a	\N	Custom: Number of women who had a live birth in the same specified period	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
217	gjRFKCKRY8E	\N	2017-01-27 10:14:08.649	2017-01-27 12:06:31.882	WASH_Performance-Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance	WASH_Performance-Standard: 3.1.8.2-2 Number of pe	Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance	Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
210	xztvU2Tceoy	\N	2017-01-27 10:14:08.649	2017-01-27 12:06:43.887	WASH_Target-Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance	WASH_Target-Standard: 3.1.8.2-2 Number of people	Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance	Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
216	RNnHOQ6Uebl	\N	2017-01-27 10:14:08.649	2017-01-27 12:07:36.234	WASH_Performance-Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply	WASH_Performance-Standard: 3.1.8.1-2 Number	Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply	Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
209	z2uZN0t05Nx	\N	2017-01-27 10:14:08.648	2017-01-27 12:07:48.673	WASH_Target-Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply	WASH_Target-Standard: 3.1.8.1-2 Number of people	Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply	Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
220	pTTwyI8nWDV	\N	2017-01-27 10:14:08.649	2017-01-27 10:14:08.696	WASH_Performance-Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products	WASH_Performance-Standard: 3.1.6.8-4 Number of li	Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products	Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
222	eF6i9grD5ya	\N	2017-01-27 10:14:08.649	2017-01-27 10:14:08.696	WASH_Performance-Custom: Number of individuals trained to implement improved sanitation methods	WASH_Performance-Custom: Number of individuals tr	Custom: Number of individuals trained to implement improved sanitation methods	Custom: Number of individuals trained to implement improved sanitation methods	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
223	QSu9BRcZ4fv	\N	2017-01-27 10:14:08.649	2017-01-27 10:14:08.696	WASH_Narrative-Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply	WASH_Narrative-Standard: 3.1.8.1-2 Number of	Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply	Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
224	d0kPBV2RUoK	\N	2017-01-27 10:14:08.649	2017-01-27 10:14:08.696	WASH_Narrative-Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance	WASH_Narrative-Standard: 3.1.8.2-2 Number of peop	Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance	Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
225	kWqUcRN1l1B	\N	2017-01-27 10:14:08.649	2017-01-27 10:14:08.696	WASH_Narrative-Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings	WASH_Narrative-Standard: 3.1.8.2-3 Number of impr	Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings	Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
226	KUzZ9M6csoR	\N	2017-01-27 10:14:08.649	2017-01-27 10:14:08.696	WASH_Narrative-Standard: 3.1.6.8-5 Number of communities certified as -open defecation free- as a result of USG assistance	WASH_Narrative-Standard: 3.1.6.8-5 Number of comm	Standard: 3.1.6.8-5 Number of communities certified as -open defecation free- as a result of USG assistance	Standard: 3.1.6.8-5 Number of communities certified as -open defecation free- as a result of USG assistance	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
227	v5Sw7FddtKR	\N	2017-01-27 10:14:08.649	2017-01-27 10:14:08.696	WASH_Narrative-Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products	WASH_Narrative-Standard: 3.1.6.8-4 Number of lite	Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products	Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
228	Npx7xpJ9345	\N	2017-01-27 10:14:08.649	2017-01-27 10:14:08.696	WASH_Narrative-Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members	WASH_Narrative-Standard: 3.1.6.8-1 Percentage of	Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members	Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
229	hkk9zyk6xwy	\N	2017-01-27 10:14:08.649	2017-01-27 10:14:08.696	WASH_Narrative-Custom: Number of individuals trained to implement improved sanitation methods	WASH_Narrative-Custom: Number of individuals trai	Custom: Number of individuals trained to implement improved sanitation methods	Custom: Number of individuals trained to implement improved sanitation methods	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
230	LTTHsqlWfXG	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	Nutrition_Performance_Custom: Total number of children under five years	Nutrition_Performance_Custom: Total number of	\N	Custom: Total number of children under five years	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
231	vBY3ZXJIDC2	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	Nutrition_Performance_Standard: 3.1.9-15 Number of children (under 5 yrs) reached by USG-supported nutrition programs	Nutrition_Performance_Standard: 3.1.9-15 Numb	\N	Standard: 3.1.9-15 Number of children (under 5 yrs) reached by USG-supported nutrition programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
232	lY71hYT1llA	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	Nutrition_Performance_Custom: Number of children under five who are wasted	Nutrition_Performance_Custom: Number of child	\N	Custom: Number of children under five who are wasted	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
233	xQc3fk7Ei26	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	Nutrition_Performance_Custom: Number of children under five who are Underweight	Nutrition_Performance_Custom: Number of childre	\N	Custom: Number of children under five who are Underweight	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
234	NTjhzlwQoLM	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	Nutrition_Performance_Standard: 3.1.9.2-2 Number of health facilities with established capacity to manage acute under-nutrition	Nutrition_Performance_Standard: 3.1.9.2-2 Num	\N	Standard: 3.1.9.2-2 Number of health facilities with established capacity to manage acute under-nutrition	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
235	WSiazJVzL1z	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	Nutrition_Performance_Standard: 3.1.9.2-3 Number of children under 5 years of age who received Vitamin A from USG-supported programs	Nutrition_Performance_Standard: 3.1.9.2-3 Numbe	\N	Standard: 3.1.9.2-3 Number of children under 5 years of age who received Vitamin A from USG-supported programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
236	J7T6ltujYx7	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	Nutrition_Target_Custom: Total number of children under five years	Nutrition_Target_Custom: Total number of chil	\N	Custom: Total number of children under five years	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
237	hA56P2gM6Uf	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	Nutrition_Target_Standard: 3.1.9-15 Number of children (under 5 yrs) reached by USG-supported nutrition programs	Nutrition_Target_Standard: 3.1.9-15 Number of	\N	Standard: 3.1.9-15 Number of children (under 5 yrs) reached by USG-supported nutrition programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
241	mbY9ZLZ2rxK	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	Nutrition_Target_Standard: 3.1.9.2-3 Number of children under 5 years of age who received Vitamin A from USG-supported programs	Nutrition_Target_Standard: 3.1.9.2-3 Number o	\N	Standard: 3.1.9.2-3 Number of children under 5 years of age who received Vitamin A from USG-supported programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
242	y0RbNrRsbGg	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	Nutrition_Narrative_Custom: Total number of children under five years	Nutrition_Narrative_Custom: Total number of c	\N	Custom: Total number of children under five years	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
243	r9IVSUKZyzA	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	Nutrition_Narrative_Standard: 3.1.9-15 Number of children (under 5 yrs) reached by USG-supported nutrition programs	Nutrition_Narrative_Standard: 3.1.9-15 Number	\N	Standard: 3.1.9-15 Number of children (under 5 yrs) reached by USG-supported nutrition programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
244	dnG1YaYE4YG	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	Nutrition_Narrative_Custom: Number of children under five who are wasted	Nutrition_Narrative_Custom: Number of childre	\N	Custom: Number of children under five who are wasted	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
245	ry418YVvQET	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	Nutrition_Narrative_Custom: Number of children under five who are Underweight	Nutrition_Narrative_Custom: Number of children	\N	Custom: Number of children under five who are Underweight	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
246	aHSzFHp1BW0	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	Nutrition_Narrative_Standard: 3.1.9.2-2 Number of health facilities with established capacity to manage acute under-nutrition	Nutrition_Narrative_Standard: 3.1.9.2-2 Numbe	\N	Standard: 3.1.9.2-2 Number of health facilities with established capacity to manage acute under-nutrition	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
247	jSbswuoVJrG	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	Nutrition_Narrative_Standard: 3.1.9.2-3 Number of children under 5 years of age who received Vitamin A from USG-supported programs	Nutrition_Narrative_Standard: 3.1.9.2-3 Number	\N	Standard: 3.1.9.2-3 Number of children under 5 years of age who received Vitamin A from USG-supported programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
248	WnsBDNlT56C	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	MCH_Performance_Custom: Number of women who received at least 4 ANC visits during the  latest pregnancy during a specified time period (year)	MCH_Performance_Custom: Number of women who r	\N	Custom: Number of women who received at least 4 ANC visits during the  latest pregnancy during a specified time period (year)	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
249	DOLECRjC6qX	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	MCH_Performance_Custom: Number of births in a given year attended by a skilled birth attendant (SBA) such as a doctor, nurse, or midwife	MCH_Performance_Custom: Number of births in a	\N	Custom: Number of births in a given year attended by a skilled birth attendant (SBA) such as a doctor, nurse, or midwife	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
250	aC0EnBg90VM	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	MCH_Performance_Custom: Number of women who had a live birth in the same specified period	MCH_Performance_Custom: Number of women who h	\N	Custom: Number of women who had a live birth in the same specified period	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
251	pKsjI7TrswT	\N	2017-01-27 10:30:45.243	2017-01-27 10:30:45.286	MCH_Performance_Custom: Number of children 12-23 months of age who received measles vaccine by the time they were 12 months of age	MCH_Performance_Custom: Number of children 12	\N	Custom: Number of children 12-23 months of age who received measles vaccine by the time they were 12 months of age	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
252	XrUYx80t4RC	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Performance_Custom: Number of children age 12-23 months of age who received third does of DPT (Diptheria, Pertussis, Tetanus) vaccine	MCH_Performance_Custom: Number of children ag	\N	Custom: Number of children age 12-23 months of age who received third does of DPT (Diptheria, Pertussis, Tetanus) vaccine	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
253	y8Us5gUE6aM	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Performance_Custom: Number of children who have received the third dose of pneumococcal conjugate vaccine by 12 months of age	MCH_Performance_Custom: Number of children wh	\N	Custom: Number of children who have received the third dose of pneumococcal conjugate vaccine by 12 months of age	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
254	JMYKCzWs5V7	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Performance_Number of children under five fully immunized	MCH_Performance_Number of children under five	\N	Number of children under five fully immunized	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
255	Yk55pEVYwur	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Performance_Custom: Number of children under five years old with diarrhea who received Oral Rehydration Therapy (ORT), defined as receiving Oral Rehydration Salt (ORS) solution	MCH_Performance_Custom: Number of children un	\N	Custom: Number of children under five years old with diarrhea who received Oral Rehydration Therapy (ORT), defined as receiving Oral Rehydration Salt (ORS) solution	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
256	Pglc4QiOKBE	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Performance_Cust: Number of children under five years of age who were ill with diarrhea	MCH_Performance_Cust: Number of children unde	\N	Cust: Number of children under five years of age who were ill with diarrhea	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
258	xmIwk9QwIkA	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Performance_Custom: Number of babies who received postnatal care within two days of childbirth in USG-supported programs	MCH_Performance_Custom: Number of babies who	\N	Custom: Number of babies who received postnatal care within two days of childbirth in USG-supported programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
259	osAT6WrYjLT	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Target_Custom: Number of women who received at least 4 ANC visits during the  latest pregnancy during a specified time period (year)	MCH_Target_Custom: Number of women who receiv	\N	Custom: Number of women who received at least 4 ANC visits during the  latest pregnancy during a specified time period (year)	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
260	anjHkoHoJwI	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Target_Custom: Number of births in a given year attended by a skilled birth attendant (SBA) such as a doctor, nurse, or midwife	MCH_Target_Custom: Number of births in a give	\N	Custom: Number of births in a given year attended by a skilled birth attendant (SBA) such as a doctor, nurse, or midwife	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
262	BaZlUsrlVXP	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Target_Custom: Number of children 12-23 months of age who received measles vaccine by the time they were 12 months of age	MCH_Target_Custom: Number of children 12-23 m	\N	Custom: Number of children 12-23 months of age who received measles vaccine by the time they were 12 months of age	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
263	UQm7qMjnIEZ	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Target_Custom: Number of children age 12-23 months of age who received third does of DPT (Diptheria, Pertussis, Tetanus) vaccine	MCH_Target_Custom: Number of children age 12-	\N	Custom: Number of children age 12-23 months of age who received third does of DPT (Diptheria, Pertussis, Tetanus) vaccine	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
264	S7beBW132zP	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Target_Custom: Number of children who have received the third dose of pneumococcal conjugate vaccine by 12 months of age	MCH_Target_Custom: Number of children who hav	\N	Custom: Number of children who have received the third dose of pneumococcal conjugate vaccine by 12 months of age	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
265	dMxahS6FN6f	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Target_Number of children under five fully immunized	MCH_Target_Number of children under five full	\N	Number of children under five fully immunized	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
266	hDMvvQNo8hn	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Target_Custom: Number of children under five years old with diarrhea who received Oral Rehydration Therapy (ORT), defined as receiving Oral Rehydration Salt (ORS) solution	MCH_Target_Custom: Number of children under f	\N	Custom: Number of children under five years old with diarrhea who received Oral Rehydration Therapy (ORT), defined as receiving Oral Rehydration Salt (ORS) solution	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
267	o86Eexzbn85	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Target_Cust: Number of children under five years of age who were ill with diarrhea	MCH_Target_Cust: Number of children under fiv	\N	Cust: Number of children under five years of age who were ill with diarrhea	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
269	rESv9AsqpgQ	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Target_Custom: Number of babies who received postnatal care within two days of childbirth in USG-supported programs	MCH_Target_Custom: Number of babies who recei	\N	Custom: Number of babies who received postnatal care within two days of childbirth in USG-supported programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
270	x34OkomkqVc	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Narrative_Custom: Number of women who received at least 4 ANC visits during the  latest pregnancy during a specified time period (year)	MCH_Narrative_Custom: Number of women who rec	\N	Custom: Number of women who received at least 4 ANC visits during the  latest pregnancy during a specified time period (year)	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
271	wWH5WtAf8bE	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Narrative_Custom: Number of births in a given year attended by a skilled birth attendant (SBA) such as a doctor, nurse, or midwife	MCH_Narrative_Custom: Number of births in a g	\N	Custom: Number of births in a given year attended by a skilled birth attendant (SBA) such as a doctor, nurse, or midwife	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
272	KQbc6dR7lMH	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Narrative_Custom: Number of women who had a live birth in the same specified period	MCH_Narrative_Custom: Number of women who had	\N	Custom: Number of women who had a live birth in the same specified period	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
273	qRfVAiLLych	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.286	MCH_Narrative_Custom: Number of children 12-23 months of age who received measles vaccine by the time they were 12 months of age	MCH_Narrative_Custom: Number of children 12-2	\N	Custom: Number of children 12-23 months of age who received measles vaccine by the time they were 12 months of age	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
274	GYfDDObvdmS	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.287	MCH_Narrative_Custom: Number of children age 12-23 months of age who received third does of DPT (Diptheria, Pertussis, Tetanus) vaccine	MCH_Narrative_Custom: Number of children age	\N	Custom: Number of children age 12-23 months of age who received third does of DPT (Diptheria, Pertussis, Tetanus) vaccine	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
275	rtZELDT3MV9	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.287	MCH_Narrative_Custom: Number of children who have received the third dose of pneumococcal conjugate vaccine by 12 months of age	MCH_Narrative_Custom: Number of children who	\N	Custom: Number of children who have received the third dose of pneumococcal conjugate vaccine by 12 months of age	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
276	Q9GTEL7yFSA	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.287	MCH_Narrative_Number of children under five fully immunized	MCH_Narrative_Number of children under five f	\N	Number of children under five fully immunized	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
277	etVEzmgOThj	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.287	MCH_Narrative_Custom: Number of children under five years old with diarrhea who received Oral Rehydration Therapy (ORT), defined as receiving Oral Rehydration Salt (ORS) solution	MCH_Narrative_Custom: Number of children unde	\N	Custom: Number of children under five years old with diarrhea who received Oral Rehydration Therapy (ORT), defined as receiving Oral Rehydration Salt (ORS) solution	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
278	zgmY8tO4pgE	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.287	MCH_Narrative_Cust: Number of children under five years of age who were ill with diarrhea	MCH_Narrative_Cust: Number of children under	\N	Cust: Number of children under five years of age who were ill with diarrhea	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
279	q8GD5ydYgZX	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.287	MCH_Narrative_Custom: Number of USG-supported facilities that provide appropriate life-saving maternity care	MCH_Narrative_Custom: Number of USG-supported	\N	Custom: Number of USG-supported facilities that provide appropriate life-saving maternity care	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
280	Mfs7Fz2OKAQ	\N	2017-01-27 10:30:45.244	2017-01-27 10:30:45.287	MCH_Narrative_Custom: Number of babies who received postnatal care within two days of childbirth in USG-supported programs	MCH_Narrative_Custom: Number of babies who re	\N	Custom: Number of babies who received postnatal care within two days of childbirth in USG-supported programs	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
395	DwIq31tjw0i	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Narrative-Number of people trained with USG funds to deliver indoor residual spraying (IRS)	Malaria_Narrative-Number of people trained with U	Number of people trained with USG funds to deliver indoor residual spraying (IRS)	Number of people trained with USG funds to deliver indoor residual spraying (IRS)	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
189	xVzGmAXrv0C	\N	2017-01-27 10:14:08.648	2017-01-27 11:18:53.019	FPRH_Target-Standard: 3.1.7.1-2 Percent of service delivery points (SDP) that experience stock out at any time during the reporting period of a contraceptive method that the SDP is expected to provide:	FPRH_Target-Standard: 3.1.7.1-2 Percent of servic	Standard: 3.1.7.1-2 Percent of service delivery points (SDP) that experience stock out at any time during the reporting period of a contraceptive method that the SDP is expected to provide:	Standard: 3.1.7.1-2 Percent of service delivery points (SDP) that experience stock out at any time during the reporting period of a contraceptive method that the SDP is expected to provide:	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	298	\N	f	\N	\N	\N	46	rw------
196	L2a4rvebe8R	\N	2017-01-27 10:14:08.648	2017-01-27 11:19:53.488	FPRH_Performance-Standard: 3.1.7.1-2 Percent of service delivery points (SDP) that experience stock out at any time during the reporting period of a contraceptive method that the SDP is expected to provide:	FPRH_Performance-Standard: 3.1.7.1-2 Percent of s	Standard: 3.1.7.1-2 Percent of service delivery points (SDP) that experience stock out at any time during the reporting period of a contraceptive method that the SDP is expected to provide:	Standard: 3.1.7.1-2 Percent of service delivery points (SDP) that experience stock out at any time during the reporting period of a contraceptive method that the SDP is expected to provide:	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	298	\N	f	\N	\N	\N	46	rw------
366	dmw9l7vXwGp	\N	2017-01-27 11:39:01.936	2017-01-27 11:39:01.97	Malaria_Target-Number of artemisinin-based combination therapy (ACT) treatments purchased with USG funds	Malaria_Target-Number of artemisinin-based combin	Number of artemisinin-based combination therapy (ACT) treatments purchased with USG funds	Number of artemisinin-based combination therapy (ACT) treatments purchased with USG funds	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
367	ShC4nyq3dYj	\N	2017-01-27 11:39:01.936	2017-01-27 11:39:01.97	Malaria_Target-Number of artemisinin-based combination therapy (ACT) treatments purchased in any fiscal year with USG funds that were distributed in this reported fiscal year	Malaria_Target-Number of artemisinin-based	Number of artemisinin-based combination therapy (ACT) treatments purchased in any fiscal year with USG funds that were distributed in this reported fiscal year	Number of artemisinin-based combination therapy (ACT) treatments purchased in any fiscal year with USG funds that were distributed in this reported fiscal year	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
368	Ug9EQH5Z6Xj	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Target-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	Malaria_Target-Number of health workers trained	Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
369	swR5MjbGClU	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Target-Number of malaria rapid diagnostic tests (RDTs) purchased with USG funds	Malaria_Target-Number of malaria rapid diagnostic	Number of malaria rapid diagnostic tests (RDTs) purchased with USG funds	Number of malaria rapid diagnostic tests (RDTs) purchased with USG funds	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
370	AhpAuZWJcm6	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Target-Number of rapid diagnostic tests (RDTs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year	Malaria_Target-Number of rapid diagnostic tests (	Number of rapid diagnostic tests (RDTs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year	Number of rapid diagnostic tests (RDTs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
371	mJUczLXzUbg	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Target-Number of insecticide treated (ITNs) purchased with USG funds	Malaria_Target-Number of insecticide treated (ITN	Number of insecticide treated (ITNs) purchased with USG funds	Number of insecticide treated (ITNs) purchased with USG funds	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
374	tYKSgbaczpT	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Target-Number of houses sprayed with IRS with USG funds	Malaria_Target-Number of houses sprayed with IRS	Number of houses sprayed with IRS with USG funds	Number of houses sprayed with IRS with USG funds	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
376	MlhKrlflsjd	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Target-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	Malaria_Target-Number of health workers trained i	Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
377	xCL2pH3iemC	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Performance-Number of artemisinin-based combination therapy (ACT) treatments purchased with USG funds	Malaria_Performance-Number of artemisinin-based c	Number of artemisinin-based combination therapy (ACT) treatments purchased with USG funds	Number of artemisinin-based combination therapy (ACT) treatments purchased with USG funds	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
394	jcim8Yur0Yo	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Narrative-Number of insecticide treated nets (ITNs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year.	Malaria_Narrative-Number of insecticide treated n	Number of insecticide treated nets (ITNs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year.	Number of insecticide treated nets (ITNs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year.	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
373	s4I2bhw8OJm	\N	2017-01-27 11:39:01.937	2017-01-27 11:45:15.363	Malaria_Target-Number of people trained with USG funds to deliver indoor residual spraying (IRS)	Malaria_Target-Number of people trained with USG	Number of people trained with USG funds to deliver indoor residual spraying (IRS)	Number of people trained with USG funds to deliver indoor residual spraying (IRS)	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
375	O06aIjjaGLd	\N	2017-01-27 11:39:01.937	2017-01-27 11:45:49.281	Malaria_Target-Total number of residents of sprayed houses	Malaria_Target-Total number of residents of spray	Total number of residents of sprayed houses	Total number of residents of sprayed houses	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
221	XoOttIwbO6x	\N	2017-01-27 10:14:08.649	2017-01-27 12:05:43.063	WASH_Performance-Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members	WASH_Performance-Standard: 3.1.6.8-1 Percentage o	Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members	Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	298	\N	f	\N	\N	\N	46	rw------
378	P4hvymX081j	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Performance-Number of artemisinin-based combination therapy (ACT) treatments purchased in any fiscal year with USG funds that were distributed in this reported fiscal year	Malaria_Performance-Number of artemisinin-bas	Number of artemisinin-based combination therapy (ACT) treatments purchased in any fiscal year with USG funds that were distributed in this reported fiscal year	Number of artemisinin-based combination therapy (ACT) treatments purchased in any fiscal year with USG funds that were distributed in this reported fiscal year	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
380	q9MU74zVFbS	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Performance-Number of malaria rapid diagnostic tests (RDTs) purchased with USG funds	Malaria_Performance-Number of malaria rapid diagn	Number of malaria rapid diagnostic tests (RDTs) purchased with USG funds	Number of malaria rapid diagnostic tests (RDTs) purchased with USG funds	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
381	nO2Qt1aQgGt	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Performance-Number of rapid diagnostic tests (RDTs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year	Malaria_Performance-Number of rapid diagnostic te	Number of rapid diagnostic tests (RDTs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year	Number of rapid diagnostic tests (RDTs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
382	pUih6k0Rw2Z	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Performance-Number of insecticide treated (ITNs) purchased with USG funds	Malaria_Performance-Number of insecticide treated	Number of insecticide treated (ITNs) purchased with USG funds	Number of insecticide treated (ITNs) purchased with USG funds	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
385	otbw2kIEUGO	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Performance-Number of houses sprayed with IRS with USG funds	Malaria_Performance-Number of houses sprayed with	Number of houses sprayed with IRS with USG funds	Number of houses sprayed with IRS with USG funds	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
388	Kj5B59Rswd4	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Narrative-Number of artemisinin-based combination therapy (ACT) treatments purchased with USG funds	Malaria_Narrative-Number of artemisinin-based com	Number of artemisinin-based combination therapy (ACT) treatments purchased with USG funds	Number of artemisinin-based combination therapy (ACT) treatments purchased with USG funds	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
389	yUwWsdKDCTp	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Narrative-Number of artemisinin-based combination therapy (ACT) treatments purchased in any fiscal year with USG funds that were distributed in this reported fiscal year	Malaria_Narrative-Number of artemisinin-based c	Number of artemisinin-based combination therapy (ACT) treatments purchased in any fiscal year with USG funds that were distributed in this reported fiscal year	Number of artemisinin-based combination therapy (ACT) treatments purchased in any fiscal year with USG funds that were distributed in this reported fiscal year	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
390	SmIFZ4loupz	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Narrative-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	Malaria_Narrative-Number of health workers train	Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
391	c43aWoYWmEv	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Narrative-Number of malaria rapid diagnostic tests (RDTs) purchased with USG funds	Malaria_Narrative-Number of malaria rapid diagnos	Number of malaria rapid diagnostic tests (RDTs) purchased with USG funds	Number of malaria rapid diagnostic tests (RDTs) purchased with USG funds	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
392	jO9qdoTvHD7	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Narrative-Number of rapid diagnostic tests (RDTs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year	Malaria_Narrative-Number of rapid diagnostic test	Number of rapid diagnostic tests (RDTs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year	Number of rapid diagnostic tests (RDTs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
393	zvXrHNHDo3V	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Narrative-Number of insecticide treated (ITNs) purchased with USG funds	Malaria_Narrative-Number of insecticide treated (	Number of insecticide treated (ITNs) purchased with USG funds	Number of insecticide treated (ITNs) purchased with USG funds	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
379	V94EunQYnIb	\N	2017-01-27 11:39:01.937	2017-01-27 17:45:37.869	Malaria_Performance-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	Malaria_Performance-Number of health workers trai	Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
384	AWWr6X4ueHE	\N	2017-01-27 11:39:01.937	2017-01-27 17:46:08.61	Malaria_Performance-Number of people trained with USG funds to deliver indoor residual spraying (IRS)	Malaria_Performance-Number of people trained with	Number of people trained with USG funds to deliver indoor residual spraying (IRS)	Number of people trained with USG funds to deliver indoor residual spraying (IRS)	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
387	zpBU6rGw28o	\N	2017-01-27 11:39:01.937	2017-01-27 17:46:34.734	Malaria_Performance-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	Malaria_Performance-Number of health workers	Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
396	H4wDG7Sx4wV	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Narrative-Number of houses sprayed with IRS with USG funds	Malaria_Narrative-Number of houses sprayed with I	Number of houses sprayed with IRS with USG funds	Number of houses sprayed with IRS with USG funds	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
397	L1xN9ygxGGJ	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Narrative-Total number of residents of sprayed houses	Malaria_Narrative-Total number of residents of sp	Total number of residents of sprayed houses	Total number of residents of sprayed houses	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
398	yLH4XfU0eM3	\N	2017-01-27 11:39:01.937	2017-01-27 11:39:01.97	Malaria_Narrative-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	Malaria_Narrative-Number of health workers traine	Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
372	BFG2SwWoDGk	\N	2017-01-27 11:39:01.937	2017-01-27 11:44:31.071	Malaria_Target-Number of insecticide treated nets (ITNs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year.	Malaria_Target-Number of insecticide treated nets	Number of insecticide treated nets (ITNs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year.	Number of insecticide treated nets (ITNs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year.	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	403	\N	f	\N	\N	\N	46	rw------
386	ph1qBBRzCaS	\N	2017-01-27 11:39:01.937	2017-01-27 11:51:44.542	Malaria_Performance-Total number of residents of sprayed houses	Malaria_Performance-Total number of residents of	Total number of residents of sprayed houses	Total number of residents of sprayed houses	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
383	d3GBSOMOMCJ	\N	2017-01-27 11:39:01.937	2017-01-27 11:59:03.318	Malaria_Performance-Number of insecticide treated nets (ITNs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year.	Malaria_Performance-Number of insecticide tre	Number of insecticide treated nets (ITNs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year.	Number of insecticide treated nets (ITNs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year.	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	403	\N	f	\N	\N	\N	46	rw------
214	ICZHF3s0V6X	\N	2017-01-27 10:14:08.649	2017-01-27 12:05:58.155	WASH_Target-Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members	WASH_Target-Standard: 3.1.6.8-1 Percentage of hou	Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members	Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	298	\N	f	\N	\N	\N	46	rw------
478	tWY6lH30ttW	\N	2017-01-27 12:34:40.851	2017-01-27 12:34:40.851	MCH_Performance_Number of children under one year who receive three doses of OPV excluding birth polio	MCH_Performance_ OPV excluding birth polio	\N	Number of children under one year who receive three doses of OPV excluding birth polio	NUMBER	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
491	G69orCd2qmO	\N	2017-01-27 12:37:36.817	2017-01-27 12:37:36.817	MCH_Performance Number of living children Under 12 months	Number of living children Under 12 months	\N	Number of living children Under 12 months	NUMBER	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
257	U2vpDK50r8a	\N	2017-01-27 10:30:45.244	2017-01-27 13:13:51.215	MCH_Performance_Custom: Number of USG-supported facilities that provide appropriate life-saving maternity care	MCH_Performance_Custom: Number of USG-support	\N	Custom: Number of USG-supported facilities that provide appropriate life-saving maternity care	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	524	\N	f	\N	\N	\N	46	rw------
268	qvJ7nQxudCX	\N	2017-01-27 10:30:45.244	2017-01-27 13:14:13.233	MCH_Target_Custom: Number of USG-supported facilities that provide appropriate life-saving maternity care	MCH_Target_Custom: Number of USG-supported fa	\N	Custom: Number of USG-supported facilities that provide appropriate life-saving maternity care	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	524	\N	f	\N	\N	\N	46	rw------
561	v76VqGBsP3l	\N	2017-01-27 14:04:28.011	2017-01-27 14:04:28.011	MCH_Target Number of living children Under 12 months	MCH_Target Number of living children Under 12 mont	\N	Number of living children Under 12 months	NUMBER	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
562	CzM4afuSRrt	\N	2017-01-27 14:05:39.347	2017-01-27 14:05:39.347	MCH_Target Custom: Number of children under one year who receive three doses of OPV excluding birth polio	MCH_Target OPV	\N	Custom: Number of children under one year who receive three doses of OPV excluding birth polio	NUMBER	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
519	A1h44ugWlxD	\N	2017-01-27 13:03:28.816	2017-01-27 14:42:53.363	MCH_Narrative_Number of children under one year who receive three doses of OPV excluding birth polio	MCH_Narrative_OPV	\N	Number of children under one year who receive three doses of OPV excluding birth polio	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
518	nnhvg87nHBJ	\N	2017-01-27 13:01:57.109	2017-01-27 14:46:20.708	MCH_Narrative_Number of living children Under 12 months	MCH_Narrative_Number of living children	\N	Number of living children Under 12 months	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
49	eQMiyC86fWH	\N	2017-01-27 10:09:45.656	2017-01-27 17:05:11.762	Training_Performance-Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	Training-Custom: Number of health service provide	Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported programs	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
67	pJDO9rjQl90	\N	2017-01-27 10:09:45.658	2017-01-27 17:06:20.632	Training_Performance-H2.1D: Number of new health care workers who graduated from a pre‐service training institution	Training-H2.1D: Number of new health care workers	H2.1D: Number of new health care workers who graduated from a pre‐service training institution	H2.1D: Number of new health care workers who graduated from a pre‐service training institution	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	295	\N	f	\N	\N	\N	46	rw------
983	DSwm3J4jSdB	\N	2017-01-27 19:11:12.325	2017-01-27 19:11:12.364	Training_Cadre-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	Training_Cadre-Number of health workers trained	Training_Cadre-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	Training_Cadre-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
984	HZCpsw3gqU6	\N	2017-01-27 19:11:12.325	2017-01-27 19:11:12.364	Training_Cadre-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	Training_Cadre-Number of health workers trained i	Training_Cadre-Number of people trained with USG funds to deliver indoor residual spraying (IRS)	Training_Cadre-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
985	lcGGcLmqeqt	\N	2017-01-27 19:11:12.325	2017-01-27 19:11:12.364	Training_Cadre-Number of people trained with USG funds to deliver indoor residual spraying (IRS)	Training_Cadre-Number of people trained with USG	Training_Curriculum-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	Training_Cadre-Number of people trained with USG funds to deliver indoor residual spraying (IRS)	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
986	XA0Bixoseya	\N	2017-01-27 19:11:12.325	2017-01-27 19:11:12.364	Training_Curriculum-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	Training_Curriculum-Number of health worke	Training_Curriculum-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	Training_Curriculum-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
987	UdoeEKC7K2d	\N	2017-01-27 19:11:12.325	2017-01-27 19:11:12.364	Training_Curriculum-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	Training_Curriculum-Number of health workers trai	Training_Curriculum-Number of people trained with USG funds to deliver indoor residual spraying (IRS)	Training_Curriculum-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
988	UA0dnYsqFMC	\N	2017-01-27 19:11:12.325	2017-01-27 19:11:12.364	Training_Curriculum-Number of people trained with USG funds to deliver indoor residual spraying (IRS)	Training_Curriculum-Number of people trained with	Training_Days_Trained-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	Training_Curriculum-Number of people trained with USG funds to deliver indoor residual spraying (IRS)	LONG_TEXT	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
989	k68I4dD2llz	\N	2017-01-27 19:11:12.325	2017-01-27 19:11:12.364	Training_Days_Trained-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	Training_Days_Trained-Number of health workers	Training_Days_Trained-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	Training_Days_Trained-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
990	GBPr5BqtOW4	\N	2017-01-27 19:11:12.325	2017-01-27 19:11:12.364	Training_Days_Trained-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	Training_Days_Trained-Number of health workers tr	Training_Days_Trained-Number of people trained with USG funds to deliver indoor residual spraying (IRS)	Training_Days_Trained-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
991	bxmq5q9a1R1	\N	2017-01-27 19:11:12.325	2017-01-27 19:11:12.364	Training_Days_Trained-Number of people trained with USG funds to deliver indoor residual spraying (IRS)	Training_Days_Trained-Number of people trained wi	Training_StartDate-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	Training_Days_Trained-Number of people trained with USG funds to deliver indoor residual spraying (IRS)	INTEGER_ZERO_OR_POSITIVE	AGGREGATE	SUM	14	\N	f	\N	\N	\N	46	rw------
992	Yuw8CQQ5EM1	\N	2017-01-27 19:11:12.325	2017-01-27 19:11:12.364	Training_StartDate-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	Training_StartDate-Number of health workers train	Training_StartDate-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	Training_StartDate-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
993	OzAydBGHVVI	\N	2017-01-27 19:11:12.325	2017-01-27 19:11:12.366	Training_StartDate-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	Training_StartDate-Number of health workers tra	Training_StartDate-Number of people trained with USG funds to deliver indoor residual spraying (IRS)	Training_StartDate-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
994	ptmYSGVRC9G	\N	2017-01-27 19:11:12.325	2017-01-27 19:11:12.368	Training_StartDate-Number of people trained with USG funds to deliver indoor residual spraying (IRS)	Training_StartDate-Number of people trained with	Training_EndDate-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	Training_StartDate-Number of people trained with USG funds to deliver indoor residual spraying (IRS)	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
995	zuNC3T0Rbcy	\N	2017-01-27 19:11:12.326	2017-01-27 19:11:12.368	Training_EndDate-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	Training_EndDate-Number of health workers train	Training_EndDate-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	Training_EndDate-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
996	PKEyefS3A61	\N	2017-01-27 19:11:12.326	2017-01-27 19:11:12.368	Training_EndDate-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	Training_EndDate-Number of health workers trained	Training_EndDate-Number of people trained with USG funds to deliver indoor residual spraying (IRS)	Training_EndDate-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
997	ZzRAEwMzaLD	\N	2017-01-27 19:11:12.326	2017-01-27 19:11:12.368	Training_EndDate-Number of people trained with USG funds to deliver indoor residual spraying (IRS)	Training_EndDate-Number of people trained with US	\N	Training_EndDate-Number of people trained with USG funds to deliver indoor residual spraying (IRS)	DATE	AGGREGATE	NONE	14	\N	f	\N	\N	\N	46	rw------
\.


--
-- Data for Name: dataelementaggregationlevels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementaggregationlevels (dataelementid, sort_order, aggregationlevel) FROM stdin;
\.


--
-- Data for Name: dataelementattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementattributevalues (dataelementid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: dataelementcategory; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementcategory (categoryid, uid, code, created, lastupdated, name, datadimensiontype, datadimension, userid, publicaccess) FROM stdin;
293	DfH7DY4oKSx	\N	2017-01-27 11:15:57.854	2017-01-27 11:15:57.854	JPHES Gender	DISAGGREGATION	f	46	rw------
294	v0Y4ALqcF0L	\N	2017-01-27 11:16:35.669	2017-01-27 11:16:35.669	JPHES Numerator/Denominator	DISAGGREGATION	f	46	rw------
402	WLo7QwJowzg	\N	2017-01-27 11:43:18.513	2017-01-27 11:43:18.513	JPHES Malaria Through Campaigns/Facilities/Private Sector	DISAGGREGATION	f	46	rw------
523	ebirfZVcd6d	\N	2017-01-27 13:10:16.518	2017-01-27 13:10:16.518	JPHES BeMONC/CeMONC	DISAGGREGATION	f	46	rw------
13	GLevLNI9wkl	default	2017-01-27 08:36:29.014	2017-01-27 20:27:23.36	default	DISAGGREGATION	f	\N	--------
\.


--
-- Data for Name: dataelementcategoryoption; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementcategoryoption (categoryoptionid, uid, code, created, lastupdated, name, shortname, startdate, enddate, userid, publicaccess) FROM stdin;
12	xYerKDKCefk	default	2017-01-27 08:36:28.998	2017-01-27 08:36:29.026	default	default	\N	\N	\N	--------
289	s8ym1AeWuar	\N	2017-01-27 11:13:51.313	2017-01-27 11:13:51.313	Numerator	Numerator	\N	\N	46	rw------
290	PTPqEdYfiUA	\N	2017-01-27 11:14:11.494	2017-01-27 11:14:11.494	Denominator	Denominator	\N	\N	46	rw------
291	hWNKTsgbG3K	\N	2017-01-27 11:14:25.833	2017-01-27 11:14:25.833	Male	Male	\N	\N	46	rw------
292	b13IbiQygIK	\N	2017-01-27 11:14:45.054	2017-01-27 11:14:45.054	Female	Female	\N	\N	46	rw------
399	Dk61T517oba	\N	2017-01-27 11:40:10.966	2017-01-27 11:40:10.966	Through campaigns	Through campaigns	\N	\N	46	rw------
400	DE84hGaNqvT	\N	2017-01-27 11:40:33.57	2017-01-27 11:40:33.57	Through health facilities	Through health facilities	\N	\N	46	rw------
401	QdhJs3zQGqD	\N	2017-01-27 11:40:52.671	2017-01-27 11:40:52.671	Through the private/commercial sector	Through the private/commercial sector	\N	\N	46	rw------
521	RtIspvZP0Kf	\N	2017-01-27 13:09:17.955	2017-01-27 13:09:17.955	BeMONC	BeMONC	\N	\N	46	rw------
522	K5PANuLOVQX	\N	2017-01-27 13:09:39.704	2017-01-27 13:09:39.704	CeMONC	CeMONC	\N	\N	46	rw------
\.


--
-- Data for Name: dataelementcategoryoptionattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementcategoryoptionattributevalues (categoryoptionid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: dataelementcategoryoptionusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementcategoryoptionusergroupaccesses (categoryoptionid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataelementcategorytranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementcategorytranslations (categoryid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataelementcategoryusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementcategoryusergroupaccesses (categoryid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataelementgroup; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementgroup (dataelementgroupid, uid, code, created, lastupdated, name, shortname, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: dataelementgroupattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementgroupattributevalues (dataelementgroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementgroupmembers (dataelementgroupid, dataelementid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementgroupset (dataelementgroupsetid, uid, code, created, lastupdated, name, description, compulsory, datadimension, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: dataelementgroupsetmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementgroupsetmembers (dataelementgroupid, dataelementgroupsetid, sort_order) FROM stdin;
\.


--
-- Data for Name: dataelementgroupsettranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementgroupsettranslations (dataelementgroupsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementgroupsetusergroupaccesses (dataelementgroupsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataelementgrouptranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementgrouptranslations (dataelementgroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementgroupusergroupaccesses (dataelementgroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataelementoperand; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementoperand (dataelementoperandid, dataelementid, categoryoptioncomboid) FROM stdin;
\.


--
-- Data for Name: dataelementtranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementtranslations (dataelementid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataelementusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataelementusergroupaccesses (dataelementid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataentryform; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataentryform (dataentryformid, uid, code, created, lastupdated, name, style, htmlcode, format) FROM stdin;
579	Uzy1xi40hDb	\N	2017-01-27 14:20:54.536	2017-01-27 14:20:54.537	Nutrition Narrative	NORMAL	<table border="1" cellpadding="1" cellspacing="1" height="720" width="800">\n\t<tbody>\n\t\t<tr>\n\t\t\t<td colspan="2" style="text-align: center; background-color: rgb(104, 70, 143);">\n\t\t\t<h1><span style="color:#FFFFFF;"><span style="font-size:26px;">Nutrition -Narrative</span></span></h1>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: center;"><strong>Indicator</strong></td>\n\t\t\t<td style="text-align: center;"><strong>Narrative</strong></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td height="20" style="height: 20px; width: 379px;">Standard: 3.1.9.2-2 Number of health facilities with established capacity to manage acute under-nutrition</td>\n\t\t\t<td style="width: 141px; text-align: center;"><input id="aHSzFHp1BW0-HllvX50cXC0-val" name="entryfield" title="Nutrition_Narrative_Standard: 3.1.9.2-2 Number of health facilities with established capacity to manage acute under-nutrition" value="[ Nutrition_Narrative_Standard: 3.1.9.2-2 Number of health facilities with established capacity to manage acute under-nutrition ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Custom: Total number of children under five years</p>\n\t\t\t</td>\n\t\t\t<td style="text-align: center;"><input id="y0RbNrRsbGg-HllvX50cXC0-val" name="entryfield" title="Nutrition_Narrative_Custom: Total number of children under five years" value="[ Nutrition_Narrative_Custom: Total number of children under five years ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Standard: 3.1.9-15 Number of children (under 5 yrs) reached by USG-supported nutrition programs</p>\n\t\t\t</td>\n\t\t\t<td style="text-align: center;"><input id="r9IVSUKZyzA-HllvX50cXC0-val" name="entryfield" title="Nutrition_Narrative_Standard: 3.1.9-15 Number of children (under 5 yrs) reached by USG-supported nutrition programs" value="[ Nutrition_Narrative_Standard: 3.1.9-15 Number of children (under 5 yrs) reached by USG-supported nutrition programs ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Custom: Number of children under five who are wasted</p>\n\t\t\t</td>\n\t\t\t<td style="text-align: center;"><input id="dnG1YaYE4YG-HllvX50cXC0-val" name="entryfield" title="Nutrition_Narrative_Custom: Number of children under five who are wasted" value="[ Nutrition_Narrative_Custom: Number of children under five who are wasted ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Custom: Number of children under five who are Underweight&nbsp;</p>\n\t\t\t</td>\n\t\t\t<td style="text-align: center;"><input id="ry418YVvQET-HllvX50cXC0-val" name="entryfield" title="Nutrition_Narrative_Custom: Number of children under five who are Underweight" value="[ Nutrition_Narrative_Custom: Number of children under five who are Underweight ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Standard: 3.1.9.2-3 Number of children under 5 years of age who received Vitamin A from USG-supported programs</p>\n\t\t\t</td>\n\t\t\t<td style="text-align: center;"><input id="jSbswuoVJrG-HllvX50cXC0-val" name="entryfield" title="Nutrition_Narrative_Standard: 3.1.9.2-3 Number of children under 5 years of age who received Vitamin A from USG-supported programs" value="[ Nutrition_Narrative_Standard: 3.1.9.2-3 Number of children under 5 years of age who received Vitamin A from USG-supported programs ]" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n\n<p>&nbsp;</p>\n	2
558	pecGtfEqmXV	\N	2017-01-27 13:44:23.365	2017-01-27 13:44:23.366	WASH Performance	NORMAL	<table border="1" cellpadding="1" cellspacing="1" style="width:800px;">\n\t<tbody>\n\t\t<tr>\n\t\t\t<th colspan="3" style="background-color: rgb(104, 70, 143);">\n\t\t\t<h2 style="text-align: -webkit-center;"><span style="color:#FFFFFF;"><strong><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><span style="line-height: 20.7999992370605px;">WASH Performance</span></span></span></strong></span></h2>\n\t\t\t</th>\n\t\t</tr>\n\t\t<tr><!--<th colspan="1" rowspan="10" style="background-color: rgb(102, 51, 255);">--><!--<h2><span style="color:#FFFFFF;"><span style="font-size:14px;"><strong><span style="font-weight: normal;">3.1.6.1 Birth Preparedness and Maternity Services</span></strong></span></span></h2>--><!--</th>--><!--<td><span style="text-align: center;">Custom: Number of women who received at least 4 ANC visits during the  latest pregnancy during a specified time period (year)</td>-->\n\t\t\t<td style="text-align: center;"><strong>Indicator</strong></td>\n\t\t\t<th>Result</th>\n\t\t\t<!--<th>% Achievement</th>-->\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="background-color: rgb(0, 51, 255);">\n\t\t\t<p><span style="text-align: center;"><span style="color:#FFFFFF;"><strong>Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply</strong></span></span></p>\n\t\t\t</td>\n\t\t\t<td>&nbsp;</td>\n\t\t\t<!--<td>&nbsp;</td>-->\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong><span style="text-align: right;">Males</span></strong></td>\n\t\t\t<td><input id="RNnHOQ6Uebl-Evq43lpHFBO-val" name="entryfield" title="WASH_Performance-Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply Male" value="[ WASH_Performance-Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply Male ]" /></td>\n\t\t\t<!--<td><input id="indicatornCPY8PfcNhZ" indicatorid="nCPY8PfcNhZ" name="indicator" readonly="readonly" title="Percent Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply male" value="[ Percent Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply male ]" /></td>-->\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong><span style="text-align: right;">Females</span></strong></td>\n\t\t\t<td><input id="RNnHOQ6Uebl-zHSeMiszM8b-val" name="entryfield" title="WASH_Performance-Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply Female" value="[ WASH_Performance-Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply Female ]" /></td>\n\t\t\t<!--<td><input id="indicatoroQ8uOBsIerk" indicatorid="oQ8uOBsIerk" name="indicator" readonly="readonly" title="Percent Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply female" value="[ Percent Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply female ]" /></td>-->\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="background-color: rgb(0, 51, 255);">\n\t\t\t<p><strong><span style="color:#FFFFFF;"><span style="text-align: center;">Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance (NOTE - SHOULD NOT INCLUDE NUMBERS FROM SCHOOLS AND HEALTH FACILITIES)</span></span></strong><span style="text-align: center;"><period></period></span></p>\n\t\t\t</td>\n\t\t\t<td>&nbsp;</td>\n\t\t\t<!--<td>&nbsp;</td>-->\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong><span style="text-align: center;">Males</span></strong></td>\n\t\t\t<td><input id="gjRFKCKRY8E-Evq43lpHFBO-val" name="entryfield" title="WASH_Performance-Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance Male" value="[ WASH_Performance-Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance Male ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong><span style="text-align: center;">Females</span></strong></td>\n\t\t\t<td><input id="gjRFKCKRY8E-zHSeMiszM8b-val" name="entryfield" title="WASH_Performance-Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance Female" value="[ WASH_Performance-Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance Female ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p><span style="text-align: center;">Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings</span></p>\n\t\t\t</td>\n\t\t\t<td><input id="JxrzCSuNroP-HllvX50cXC0-val" name="entryfield" title="WASH_Performance-Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings" value="[ WASH_Performance-Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings ]" /></td>\n\t\t\t<!--<td><input id="indicatorYp0vjwrgjGG" indicatorid="Yp0vjwrgjGG" name="indicator" readonly="readonly" title="Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings" value="[ Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings ]" /></td>-->\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p><span style="text-align: center;">Standard: 3.1.6.8-5 Number of communities certified as &ldquo;open defecation free&rdquo; as a result of USG assistance</span></p>\n\t\t\t</td>\n\t\t\t<td><input id="jDOCGV6pDJp-HllvX50cXC0-val" name="entryfield" title="WASH_Performance-Standard: 3.1.6.8-5 Number of communities certified as -open defecation free- as a result of USG assistance" value="[ WASH_Performance-Standard: 3.1.6.8-5 Number of communities certified as -open defecation free- as a result of USG assistance ]" /></td>\n\t\t\t<!--<td><input id="indicatormGMXr9FnbyB" indicatorid="mGMXr9FnbyB" name="indicator" readonly="readonly" title="Standard: 3.1.6.8-5 Number of communities certified as “open defecation free” as a result of USG assistance." value="[ Standard: 3.1.6.8-5 Number of communities certified as “open defecation free” as a result of USG assistance. ]" /></td>-->\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p><span style="text-align: center;">Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products</span></p>\n\t\t\t</td>\n\t\t\t<td><input id="pTTwyI8nWDV-HllvX50cXC0-val" name="entryfield" title="WASH_Performance-Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products" value="[ WASH_Performance-Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products ]" /></td>\n\t\t\t<!--<td><input id="indicatoriljcNk23Wy7" indicatorid="iljcNk23Wy7" name="indicator" readonly="readonly" title="Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products" value="[ Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products ]" /></td>-->\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="background-color: rgb(0, 51, 255);"><strong><span style="color:#FFFFFF;"><span style="font-family: LiberationSans, arial, sans-serif; font-size: 12px; line-height: 16.8px;">Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members (Denominator - Total households ( of project catchment area)</span></span></strong></td>\n\t\t\t<td>&nbsp;</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p><strong style="font-family: LiberationSans, arial, sans-serif; line-height: 16.8px; color: rgb(34, 34, 34); font-size: 12px; background-color: rgb(252, 253, 253);">Numerator</strong><span style="color: rgb(34, 34, 34); font-family: LiberationSans, arial, sans-serif; font-size: 12px; line-height: 16.8px; background-color: rgb(252, 253, 253);">: Number of households with soap and water</span></p>\n\t\t\t</td>\n\t\t\t<td><input id="XoOttIwbO6x-IhtLhkHwYrQ-val" name="entryfield" title="WASH_Performance-Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members Numerator" value="[ WASH_Performance-Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members Numerator ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p><strong style="font-family: LiberationSans, arial, sans-serif; line-height: 16.8px; color: rgb(34, 34, 34); font-size: 12px; background-color: rgb(252, 253, 253);">Denominator</strong><span style="color: rgb(34, 34, 34); font-family: LiberationSans, arial, sans-serif; font-size: 12px; line-height: 16.8px; background-color: rgb(252, 253, 253);">: Total numberof households of project catchment area</span></p>\n\t\t\t</td>\n\t\t\t<td><input id="XoOttIwbO6x-G9dsIX6YwR6-val" name="entryfield" title="WASH_Performance-Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members Denominator" value="[ WASH_Performance-Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members Denominator ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td><span style="color: rgb(34, 34, 34); font-family: LiberationSans, arial, sans-serif; font-size: 12px; line-height: 16.8px; background-color: rgb(252, 253, 253);">Custom: Number of individuals trained to implement improved sanitation methods</span></td>\n\t\t\t<td><input id="eF6i9grD5ya-HllvX50cXC0-val" name="entryfield" title="WASH_Performance-Custom: Number of individuals trained to implement improved sanitation methods" value="[ WASH_Performance-Custom: Number of individuals trained to implement improved sanitation methods ]" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n\n<p>&nbsp;</p>\n	2
441	VZR7DdFPvel	\N	2017-01-27 12:12:44.137	2017-01-27 13:51:49.013	Maternal and Child Health Performance	NORMAL	<table border="1" cellpadding="1" cellspacing="1" style="width:800px;">\n\t<tbody>\n\t\t<tr>\n\t\t\t<th colspan="4" style="background-color: rgb(102, 0, 153);">\n\t\t\t<h1 style="text-align: -webkit-center;"><span style="font-size:16px;"><span style="color:#FFFFFF;"><strong><span style="font-family:arial,helvetica,sans-serif;"><span style="line-height: 20.7999992370605px;">Maternal and Child Health Performance</span></span></strong></span></span></h1>\n\t\t\t</th>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1"><strong>Indicators</strong></td>\n\t\t\t<th>Result</th>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of women who received at least 4 ANC visits during the latest pregnancy during a specified time period (year)</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="WnsBDNlT56C-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of births in a given year attended by a skilled birth attendant (SBA) such as a doctor, nurse, or midwife</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="DOLECRjC6qX-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of women who had a live birth in the same specified</span><span style="text-align: center;"> <period></period></span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="aC0EnBg90VM-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of children 12-23 months of age who received measles vaccine by the time they were 12 months of age:</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="pKsjI7TrswT-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of children age 12-23 months of age who received third doses of DPT (Diptheria, Pertussis, Tetanus) vaccine:</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="XrUYx80t4RC-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of children who have received the third dose of pneumococcal conjugate vaccine by 12 months of age:</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="y8Us5gUE6aM-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Number of children under five fully immunized</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="JMYKCzWs5V7-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of children under one year who receive three doses of OPV excluding birth polio</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="tWY6lH30ttW-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Number of living children Under 12 months</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="G69orCd2qmO-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of children under five years old with diarrhea who received Oral Rehydration Therapy (ORT), defined as receiving Oral Rehydration Salt (ORS) solution:</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="Yk55pEVYwur-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of children under five years of age who were ill with diarrhea :</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="Pglc4QiOKBE-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of babies who received postnatal care within two days of childbirth in USG-supported programs&nbsp;:</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="xmIwk9QwIkA-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n\n<p>&nbsp;</p>\n	2
528	XqLohvPYRw0	\N	2017-01-27 13:23:05.797	2017-01-27 14:39:20.405	Family Planning and Reproductive Health Performance	NORMAL	<table border="1" cellpadding="1" cellspacing="1" style="width:800px;">\n\t<tbody>\n\t\t<tr>\n\t\t\t<td colspan="2" style="text-align: center; background-color: rgb(153, 51, 255);">\n\t\t\t<h1><span style="color:#FFFFFF;">Family Planning and Reproductive Health Performance</span></h1>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: center;"><strong>Indicators</strong></td>\n\t\t\t<td style="text-align: center;"><strong>Results</strong></td>\n\t\t</tr>\n\t\t<!--<tr>\n\t\t\t<td style="background-color: rgb(0, 0, 204);">\n\t\t\t<p><strong><span style="color:#ffffff;">Standard: 3.1.7.1-2 Percent of service delivery points (SDP) that experience stock out at any time during the reporting period of a contraceptive method that the SDP is expected to provide</span></strong></p>\n\t\t\t</td>\n\t\t\t<td></td>\n\t\t</tr>-->\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p><strong>Numerator</strong>:&nbsp;<span style="line-height: 23.1111px;">&nbsp;Number of service delivery points (SDP) that experience stock out at any time during the reporting period of a contraceptive method that the SDP is expected to provide</span></p>\n\t\t\t</td>\n\t\t\t<td><input id="L2a4rvebe8R-IhtLhkHwYrQ-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td><strong>Denominator</strong>:<span style="line-height: 23.1111px;">Number of service delivery sites providing family planning(FP) counselling and/or services</span></td>\n\t\t\t<td>\n\t\t\t<p>&nbsp;</p>\n\n\t\t\t<p><input id="L2a4rvebe8R-G9dsIX6YwR6-val" name="entryfield" title="" value="" /></p>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Standard: 3.1.7.1-4 Number of additional USG-assisted community health workers (CHWs) providing family planning (FP) information</p>\n\t\t\t</td>\n\t\t\t<td><input id="XEVaFYluMsT-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n\n<p>&nbsp;</p>\n	2
517	pLIE2awVGvV	\N	2017-01-27 12:49:29.289	2017-01-27 18:42:10.557	National Performance	NORMAL	<script>\n\njQuery(document).ready( function() {\n\n          jQuery( '#tabs' ).tabs({ collapsible : true });\n\n    });\n\n</script>\n<style type="text/css">.floatingHeader {\n      position: fixed;\n      top: 45px;\n      width:96%;\n      visibility: hidden;\n    }\n\n  td, th{\n       /* css-3 */\n       white-space: -o-pre-wrap;\n       word-wrap: break-word;\n       white-space: pre-wrap;\n       white-space: -moz-pre-wrap;\n       white-space: -pre-wrap;\n\n   }\n\n.container-content{\n    width:96%;\n    overflow-x: auto;\n    white-space: nowrap;\n}\n\n\n\n*{\n  margin: 0;\n  padding: 0;\n}\nbody {\n  font: 14px Georgia, serif;\n}\nh1 {\n  font: 32px Georgia, Serif;\n  margin: 0 0 20px 0;\n}\np {\n  margin: 0 0 20px 0;\n}\n#page-wrap {\n  width: 500px;\n  margin: 100px auto;\n}\n.spacer {\n  height: 600px;\n}\ntable {\n  border-collapse: collapse;\n}\nth {\n  background-color: lightgrey;\n  padding: 10px;\n  width: 200px;\n  text-align: left;\n}\ntr:nth-child(odd) {\n  background: #eee;\n}\ntd {\n  padding: 10px;\n  width: 200px;\n}\n\n.some-other-area {\n  margin: 300px 0;\n  line-height: 2;\n}\nh2 {\n  background: lightgrey;\n  padding: 10px;\n  font: 28px Georgia, Serif;\n  margin: 0 0 20px 0;\n}\n</style>\n<style type="text/css">table.tableizer-table {\n        font-size: 12px;\n        border: 1px solid #CCC;\n        font-family: Arial, Helvetica, sans-serif;\n    }\n    .tableizer-table td {\n        padding: 4px;\n        margin: 3px;\n        border: 1px solid #CCC;\n    }\n    .tableizer-table th {\n        background-color: #104E8B;\n        color: #FFF;\n        font-weight: bold;\n    }\n\n.ui-widget, .ui-widget input, .ui-widget select, .ui-widget textarea, .ui-widget button\n{\n  font-family: LiberationSans, arial, sans-serif !important;\n  font-size: 9pt !important;\n}\n</style>\n<div id="tabs">\n<ul>\n\t<li alignment="left"><a href="#tab-1">FP_RH Indicators</a></li>\n\t<li alignment="left"><a href="#tab-2">Malaria Indicators</a></li>\n\t<li alignment="left"><a href="#tab-3">WASH</a></li>\n</ul>\n\n<div id="tab-1">\n<table border="1" cellpadding="0" cellspacing="0" class="tableizer-table persist-area" height="173" style="width:800px;" width="703">\n\t<colgroup>\n\t\t<col />\n\t\t<col />\n\t</colgroup>\n\t<tbody>\n\t\t<tr>\n\t\t\t<td colspan="3" style="text-align: center; background-color: rgb(104, 70, 143);">\n\t\t\t<h1><span style="color:#FFFFFF;"><span style="font-size:26px;">Family Planning and Reproductive Health&nbsp;-National</span></span></h1>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr height="60">\n\t\t\t<td height="60" style="height:60px;width:389px;">Custom: Number&nbsp; of new policies developed with USG assistance to improve access and use of FP/RH, MCH and Nutrition services, by stage of development:</td>\n\t\t\t<td style="width:132px;"><input id="Ip5yoU6shDQ-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td style="width:132px;"><input id="FWWoDxKlXRg-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="60">\n\t\t\t<td height="60" style="height:60px;width:389px;">Custom: Number of new Guidelines or Strategic Plans developed with USG assistance to improve access to and use of FP/RH:</td>\n\t\t\t<td style="width:132px;"><input id="LO82gr1TWLO-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td style="width:132px;"><input id="RXwOwGXICBe-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="40">\n\t\t\t<td height="40" style="height:40px;width:389px;">Custom: Number of policies or guidelines developed or changed to improve access to and use of FP/RH services :</td>\n\t\t\t<td style="width:132px;"><input id="OdOuVJFLPcX-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td style="width:132px;"><input id="a5JH70aUwTP-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td height="40" style="height:40px;width:389px;"><span style="line-height: 23.1111px;">Custom: Percent increase on contraceptive commodity reporting rates</span></td>\n\t\t\t<td style="width:132px;"><input id="KBBqoa2QB7C-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td style="width: 132px; background-color: rgb(204, 204, 204);">&nbsp;</td>\n\t\t</tr>\n\t</tbody>\n</table>\n</div>\n\n<div id="tab-2">\n<table border="1" cellpadding="0" cellspacing="0" class="tableizer-table persist-area" height="194" style="width:800px;" width="697">\n\t<colgroup>\n\t\t<col />\n\t\t<col />\n\t\t<col />\n\t</colgroup>\n\t<tbody>\n\t\t<tr>\n\t\t\t<td colspan="3" style="text-align: center; background-color: rgb(104, 70, 143);">\n\t\t\t<h1><span style="color:#FFFFFF;"><span style="font-size:26px;">Malaria -National</span></span></h1>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr height="40">\n\t\t\t<td height="60" rowspan="2" style="height:60px;width:59px;">3.1.3.1-3</td>\n\t\t\t<td rowspan="2" style="width:329px;">Number of artemisinin-based combination therapy (ACT) treatments purchased with USG funds</td>\n\t\t\t<td rowspan="2" style="width:123px;"><input id="xCL2pH3iemC-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t</tr>\n\t\t<tr height="40">\n\t\t\t<td height="40" style="height:40px;width:59px;">3.1.3.1-6</td>\n\t\t\t<td style="width:329px;">Number of malaria rapid diagnostic tests (RDTs) purchased with USG funds</td>\n\t\t\t<td style="width:123px;"><input id="q9MU74zVFbS-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="40">\n\t\t\t<td height="40" style="height:40px;width:59px;">3.1.3.2-2</td>\n\t\t\t<td style="width:329px;">Number of insecticide treated (ITNs) purchased with USG funds</td>\n\t\t\t<td style="width:123px;"><input id="pUih6k0Rw2Z-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n</div>\n\n<div id="tab-3">\n<table border="1" cellpadding="0" cellspacing="0" class="tableizer-table persist-area" style="width:800px;" width="697">\n\t<colgroup>\n\t\t<col />\n\t\t<col />\n\t\t<col />\n\t</colgroup>\n\t<tbody>\n\t\t<tr>\n\t\t\t<td colspan="3" style="text-align: center; background-color: rgb(104, 70, 143);">\n\t\t\t<h1><span style="color:#FFFFFF;"><span style="font-size:26px;">WASH -National</span></span></h1>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr height="40">\n\t\t\t<td height="40" style="height:40px;width:59px;">3.1.6.8-4</td>\n\t\t\t<td style="width:329px;">Number of liters of drinking water disinfected with point-of-use treatment products</td>\n\t\t\t<td style="width:123px;"><input id="pTTwyI8nWDV-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n</div>\n</div>\n\n<p>&nbsp;</p>\n	2
520	RyiMeeIH2vP	\N	2017-01-27 13:08:02.193	2017-01-27 18:48:02.714	County Performance	NORMAL	<script>\njQuery(document).ready( function() {\n\n          jQuery( '#tabs' ).tabs({ collapsible : true });\n\n    });\n\n</script>\n<div>\n<div class="left" id="tabs">\n<ul>\n\t<li alignment="left"><a href="#tab-1">Nutrition indicators</a></li>\n\t<li alignment="left"><a href="#tab-2">MCH indicators</a></li>\n\t<li alignment="left"><a href="#tab-3">FP_RH indicators</a></li>\n\t<li alignment="left"><a href="#tab-5">Malaria indicators</a></li>\n</ul>\n\n<div id="tab-1">\n<div>\n<table border="1" cellpadding="0" cellspacing="0" class="tableizer-table persist-area" style="width:800px;" width="733">\n\t<tbody>\n\t\t<tr>\n\t\t\t<td colspan="2" style="text-align: center; background-color: rgb(102, 0, 153);">\n\t\t\t<h1><span style="color:#FFFFFF;"><span style="font-size:26px;">Nutrition Performance</span></span></h1>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td height="20" style="height: 20px; width: 379px;">Standard: 3.1.9.2-2 Number of health facilities with established capacity to manage acute under-nutrition</td>\n\t\t\t<td style="width:141px;"><input id="NTjhzlwQoLM-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n</div>\n</div>\n\n<div id="tab-2">\n<div>\n<table border="1" cellpadding="0" cellspacing="0" class="tableizer-table persist-area" style="width:800px;" width="712">\n\t<colgroup>\n\t\t<col />\n\t\t<col />\n\t</colgroup>\n\t<tbody>\n\t\t<tr>\n\t\t\t<td colspan="3" style="text-align: center; background-color: rgb(102, 0, 153);">\n\t\t\t<h1><span style="color:#FFFFFF;"><span style="font-size:26px;">MCH Performance</span></span></h1>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1" style="background-color: rgb(0, 51, 255);"><strong><span style="color:#FFFFFF;">Custom: Number of USG-supported facilities that provide appropriate life-saving maternity care(This will be defined as seven signal functions for BEmONC and nine signal functions for CEmONC):</span></strong></td>\n\t\t\t<td style="width: 93px; text-align: center;">\n\t\t\t<p>&nbsp;</p>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: right;"><strong>BEMONC</strong></td>\n\t\t\t<td style="width: 93px; text-align: center;"><input id="U2vpDK50r8a-I0q6bcGoQjP-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: right;"><strong>CeMONC</strong></td>\n\t\t\t<td style="width: 93px; text-align: center;"><input id="U2vpDK50r8a-rcYc8tKldbt-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n</div>\n</div>\n\n<div id="tab-3">\n<div>\n<table border="1" cellpadding="0" cellspacing="0" class="tableizer-table persist-area" style="width:800px;" width="743">\n\t<tbody>\n\t\t<tr>\n\t\t\t<td colspan="2" style="background-color: rgb(102, 0, 153);">\n\t\t\t<h1 style="text-align: center;"><span style="color:#FFFFFF;"><span style="font-size:26px;">FP_RH Performance</span></span></h1>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td height="40" style="height:40px;width:389px;">Standard: 3.1.7.1-1 Couple-years of protection (CYP) in USG-supported programs</td>\n\t\t\t<td style="width:132px;"><input id="fFHrUCoF1dG-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="background-color: rgb(0, 0, 204);">\n\t\t\t<p><strong><span style="color:#ffffff;">Standard: 3.1.7.1-2 Percent of service delivery points (SDP) that experience stock out at any time during the reporting period of a contraceptive method that the SDP is expected to provide</span></strong></p>\n\t\t\t</td>\n\t\t\t<td>&nbsp;</td>\n\t\t</tr>\n\t</tbody>\n</table>\n</div>\n</div>\n\n<div id="tab-5">\n<div>\n<table border="1" cellpadding="1" cellspacing="1" class="tableizer-table persist-area" height="662" style="width:800px;" width="733">\n\t<tbody>\n\t\t<tr>\n\t\t\t<td colspan="4" style="text-align: center; background-color: rgb(102, 0, 153);">\n\t\t\t<h1><span style="color:#FFFFFF;"><span style="font-size:26px;">Malaria Performance</span></span></h1>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>3.1.3.1-4</td>\n\t\t\t<td>Number of artemisinin-based combination therapy (ACT) treatments purchased in any fiscal year with USG funds that were distributed in this reported fiscal year</td>\n\t\t\t<td><input id="P4hvymX081j-HllvX50cXC0-val" name="entryfield" title="" value="" />\n\t\t\t<p>&nbsp;</p>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="white-space: nowrap;">3.1.3.1-8 &nbsp;&nbsp;</td>\n\t\t\t<td>Number of rapid diagnostic tests (RDTs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year</td>\n\t\t\t<td><input id="nO2Qt1aQgGt-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="1" rowspan="4">3.1.3.2-3</td>\n\t\t\t<td rowspan="1" style="background-color: rgb(0, 51, 255);"><strong><span style="color:#FFFFFF;">Number of insecticide treated nets (ITNs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year. </span></strong></td>\n\t\t\t<td rowspan="1">&nbsp;</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong>Through campaigns</strong></td>\n\t\t\t<td><input id="d3GBSOMOMCJ-s3wXi7AxrqM-val" name="entryfield" title="" value="" />\n\t\t\t<p>&nbsp;</p>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong>Through health facilities</strong></td>\n\t\t\t<td><input id="d3GBSOMOMCJ-nozAOHqLOkI-val" name="entryfield" title="" value="" />\n\t\t\t<p>&nbsp;</p>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong>Through the private/commercial sector</strong></td>\n\t\t\t<td><input id="d3GBSOMOMCJ-ZM7SBqwEmUZ-val" name="entryfield" title="" value="" />\n\t\t\t<p>&nbsp;</p>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>3.1.3.3-3</td>\n\t\t\t<td>Number of houses sprayed with IRS with USG funds</td>\n\t\t\t<td><input id="otbw2kIEUGO-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="1" rowspan="3">3.1.3.3-4</td>\n\t\t\t<td rowspan="1" style="background-color: rgb(0, 51, 255);"><strong><span style="color:#FFFFFF;">Total number of residents of sprayed houses</span></strong></td>\n\t\t\t<td rowspan="1">&nbsp;</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong>Male</strong></td>\n\t\t\t<td><input id="ph1qBBRzCaS-Evq43lpHFBO-val" name="entryfield" title="" value="" />\n\t\t\t<p>&nbsp;</p>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong>Female</strong></td>\n\t\t\t<td><input id="ph1qBBRzCaS-zHSeMiszM8b-val" name="entryfield" title="" value="" />\n\t\t\t<p>&nbsp;</p>\n\t\t\t</td>\n\t\t</tr>\n\t</tbody>\n</table>\n</div>\n</div>\n</div>\n</div>\n\n<p>&nbsp;</p>\n	2
529	NgRcQ0NmBAw	\N	2017-01-27 13:25:17.539	2017-01-27 13:26:25.141	Maternal and Child Health Narrative	NORMAL	<div>\n<table border="1" cellpadding="1" cellspacing="1" style="width:800px;">\n\t<tbody>\n\t\t<tr>\n\t\t\t<th colspan="3" style="background-color: rgb(102, 0, 153);">\n\t\t\t<h2 style="text-align: -webkit-center;"><span style="color:#FFFFFF;"><strong><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><span style="line-height: 20.7999992370605px;">Maternal and Child Health Narrative</span></span></span></strong></span></h2>\n\t\t\t</th>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of women who received at least 4 ANC visits during the latest pregnancy during a specified time period(year) </span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="x34OkomkqVc-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of births in a given year attended by a skilled birth attendant (SBA) such as a doctor, nurse, or midwife</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="wWH5WtAf8bE-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of women who had a live birth in the same specified period</span><span style="text-align: center;"> <period></period></span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="KQbc6dR7lMH-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of children age 12-23 months of age who received measles vaccine by the time they were 12 months of age</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="qRfVAiLLych-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of children age 12-23 months of age who received third does of DPT (Diptheria, Pertussis, Tetanus) vaccine</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="GYfDDObvdmS-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of children who have received the third dose of pneumococcal conjugate vaccine by 12 months of age</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="rtZELDT3MV9-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Number of children under five fully immunized</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="Q9GTEL7yFSA-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of children under one year who receive three doses of OPV excluding birth polio</span></p>\n\t\t\t</td>\n\t\t\t<td style="text-align: center;"><input id="A1h44ugWlxD-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Number of living children Under 12 months</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="nnhvg87nHBJ-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of children under five years old with diarrhea who received Oral Rehydration Therapy (ORT), defined as receiving Oral Rehydration Salt (ORS) solution</span></p>\n\t\t\t</td>\n\t\t\t<td style="text-align: center;"><input id="etVEzmgOThj-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Cust: Number of children under five years of age who were ill with diarrhea </span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="zgmY8tO4pgE-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1"><span style="text-align: center;">Custom: Number of babies who received postnatal care within two days of childbirth in USG-supported programs &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="Mfs7Fz2OKAQ-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n</div>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n	2
557	YEXEeiWuI7U	\N	2017-01-27 13:38:49.803	2017-01-27 13:38:49.803	Malaria Target	NORMAL	<div id="tab-5">\n<table border="1" cellpadding="1" cellspacing="1" height="662" style="width:800px;" width="733">\n\t<tbody>\n\t\t<tr>\n\t\t\t<td colspan="4" style="text-align: center; background-color: rgb(102, 0, 153);">\n\t\t\t<h1><span style="color:#FFFFFF;"><span style="font-size:26px;">Malaria Target</span></span></h1>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="white-space: nowrap;">3.1.3.1-4</td>\n\t\t\t<td>\n\t\t\t<p>Number of artemisinin-based combination therapy (ACT) treatments purchased in any fiscal year with USG funds that were distributed in this reported fiscal year</p>\n\t\t\t</td>\n\t\t\t<td><input id="ShC4nyq3dYj-HllvX50cXC0-val" name="entryfield" title="Malaria_Target-Number of artemisinin-based combination therapy (ACT) treatments purchased in any fiscal year with USG funds that were distributed in this reported fiscal year" value="[ Malaria_Target-Number of artemisinin-based combination therapy (ACT) treatments purchased in any fiscal year with USG funds that were distributed in this reported fiscal year ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>3.1.3.1-8</td>\n\t\t\t<td>\n\t\t\t<p>Number of rapid diagnostic tests (RDTs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year</p>\n\t\t\t</td>\n\t\t\t<td><input id="AhpAuZWJcm6-HllvX50cXC0-val" name="entryfield" title="Malaria_Target-Number of rapid diagnostic tests (RDTs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year" value="[ Malaria_Target-Number of rapid diagnostic tests (RDTs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="1" rowspan="4">3.1.3.2-3</td>\n\t\t\t<td rowspan="1" style="background-color: rgb(0, 102, 255);"><span style="color:#FFFFFF;"><strong>Number of insecticide treated nets (ITNs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year.</strong></span></td>\n\t\t\t<td rowspan="1">&nbsp;</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong>Through campaigns</strong></td>\n\t\t\t<td><input id="BFG2SwWoDGk-s3wXi7AxrqM-val" name="entryfield" title="Malaria_Target-Number of insecticide treated nets (ITNs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year. Through campaigns" value="[ Malaria_Target-Number of insecticide treated nets (ITNs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year. Through campaigns ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong>Through health facilities</strong></td>\n\t\t\t<td><input id="BFG2SwWoDGk-nozAOHqLOkI-val" name="entryfield" title="Malaria_Target-Number of insecticide treated nets (ITNs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year. Through health facilities" value="[ Malaria_Target-Number of insecticide treated nets (ITNs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year. Through health facilities ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong>Through the private/commercial sector</strong></td>\n\t\t\t<td><input id="BFG2SwWoDGk-ZM7SBqwEmUZ-val" name="entryfield" title="Malaria_Target-Number of insecticide treated nets (ITNs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year. Through the private/commercial sector" value="[ Malaria_Target-Number of insecticide treated nets (ITNs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year. Through the private/commercial sector ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>3.1.3.3-3</td>\n\t\t\t<td>Number of houses sprayed with IRS with USG funds</td>\n\t\t\t<td><input id="tYKSgbaczpT-HllvX50cXC0-val" name="entryfield" title="Malaria_Target-Number of houses sprayed with IRS with USG funds" value="[ Malaria_Target-Number of houses sprayed with IRS with USG funds ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="1" rowspan="1">3.1.3.3-4</td>\n\t\t\t<td rowspan="1" style="background-color: rgb(0, 102, 255);"><span style="color:#FFFFFF;"><strong>Total number of residents of sprayed houses</strong></span></td>\n\t\t\t<td rowspan="1">&nbsp;</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="1" rowspan="2">3.1.3.4-1</td>\n\t\t\t<td style="text-align: right;"><strong>Male</strong></td>\n\t\t\t<td><input id="O06aIjjaGLd-Evq43lpHFBO-val" name="entryfield" title="Malaria_Target-Total number of residents of sprayed houses Male" value="[ Malaria_Target-Total number of residents of sprayed houses Male ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong>Female</strong></td>\n\t\t\t<td><input id="O06aIjjaGLd-zHSeMiszM8b-val" name="entryfield" title="Malaria_Target-Total number of residents of sprayed houses Female" value="[ Malaria_Target-Total number of residents of sprayed houses Female ]" /></td>\n\t\t</tr>\n\t\t<tr height="40">\n\t\t\t<td height="60" rowspan="2" style="height:60px;width:59px;">3.1.3.1-3</td>\n\t\t\t<td rowspan="2" style="width:329px;">Number of artemisinin-based combination therapy (ACT) treatments purchased with USG funds</td>\n\t\t\t<td rowspan="2" style="width:123px;"><input id="dmw9l7vXwGp-HllvX50cXC0-val" name="entryfield" title="Malaria_Target-Number of artemisinin-based combination therapy (ACT) treatments purchased with USG funds" value="[ Malaria_Target-Number of artemisinin-based combination therapy (ACT) treatments purchased with USG funds ]" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t</tr>\n\t\t<tr height="40">\n\t\t\t<td height="40" style="height:40px;width:59px;">3.1.3.1-6</td>\n\t\t\t<td style="width:329px;">Number of malaria rapid diagnostic tests (RDTs) purchased with USG funds</td>\n\t\t\t<td style="width:123px;"><input id="swR5MjbGClU-HllvX50cXC0-val" name="entryfield" title="Malaria_Target-Number of malaria rapid diagnostic tests (RDTs) purchased with USG funds" value="[ Malaria_Target-Number of malaria rapid diagnostic tests (RDTs) purchased with USG funds ]" /></td>\n\t\t</tr>\n\t\t<tr height="40">\n\t\t\t<td height="40" style="height:40px;width:59px;">3.1.3.2-2</td>\n\t\t\t<td style="width:329px;">Number of insecticide treated (ITNs) purchased with USG funds</td>\n\t\t\t<td style="width:123px;"><input id="mJUczLXzUbg-HllvX50cXC0-val" name="entryfield" title="Malaria_Target-Number of insecticide treated (ITNs) purchased with USG funds" value="[ Malaria_Target-Number of insecticide treated (ITNs) purchased with USG funds ]" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n</div>\n	2
559	e2VKBQTGLfi	\N	2017-01-27 13:47:11.787	2017-01-27 13:47:11.787	WASH Narrative	NORMAL	<table border="1" cellpadding="1" cellspacing="1" style="width:800px;">\n\t<tbody>\n\t\t<tr>\n\t\t\t<th colspan="3" style="background-color: rgb(104, 70, 143);">\n\t\t\t<h2 style="text-align: -webkit-center;"><span style="color:#FFFFFF;"><strong><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><span style="line-height: 20.7999992370605px;">WASH Narrative</span></span></span></strong></span></h2>\n\t\t\t</th>\n\t\t</tr>\n\t\t<tr><!--<th colspan="1" rowspan="10" style="background-color: rgb(102, 51, 255);">--><!--<h2><span style="color:#FFFFFF;"><span style="font-size:14px;"><strong><span style="font-weight: normal;">3.1.6.1 Birth Preparedness and Maternity Services</span></strong></span></span></h2>--><!--</th>--><!--<td><span style="text-align: center;">Custom: Number of women who received at least 4 ANC visits during the  latest pregnancy during a specified time period (year)</td>-->\n\t\t\t<td style="text-align: center;"><strong>Indicator</strong></td>\n\t\t\t<td><strong>Narrative</strong></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="background-color: rgb(0, 0, 204);">\n\t\t\t<p><strong><span style="color:#ffffff;"><span style="text-align: center;">Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply</span></span></strong></p>\n\t\t\t</td>\n\t\t\t<td colspan="1" rowspan="3"><input id="QSu9BRcZ4fv-HllvX50cXC0-val" name="entryfield" title="WASH_Narrative-Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply" value="[ WASH_Narrative-Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong><span style="text-align: center;">Males</span></strong></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong><span style="text-align: center;">Females</span></strong></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="background-color: rgb(0, 0, 204);">\n\t\t\t<p><span style="text-align: center;"><strong><span style="color:#ffffff;">Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance (NOTE - SHOULD NOT INCLUDE NUMBERS FROM SCHOOLS AND HEALTH FACILITIES)</span></strong></span><span style="text-align: center;"><period></period></span></p>\n\t\t\t</td>\n\t\t\t<td colspan="1" rowspan="3"><input id="d0kPBV2RUoK-HllvX50cXC0-val" name="entryfield" title="WASH_Narrative-Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance" value="[ WASH_Narrative-Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong><span style="text-align: center;">Males</span></strong></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong><span style="text-align: center;">Females</span></strong></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p><span style="text-align: center;">Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings</span></p>\n\t\t\t</td>\n\t\t\t<td><input id="kWqUcRN1l1B-HllvX50cXC0-val" name="entryfield" title="WASH_Narrative-Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings" value="[ WASH_Narrative-Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p><span style="text-align: center;">Standard: 3.1.6.8-5 Number of communities certified as &ldquo;open defecation free&rdquo; as a result of USG assistance</span></p>\n\t\t\t</td>\n\t\t\t<td><input id="KUzZ9M6csoR-HllvX50cXC0-val" name="entryfield" title="WASH_Narrative-Standard: 3.1.6.8-5 Number of communities certified as -open defecation free- as a result of USG assistance" value="[ WASH_Narrative-Standard: 3.1.6.8-5 Number of communities certified as -open defecation free- as a result of USG assistance ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p><span style="text-align: center;">Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products</span></p>\n\t\t\t</td>\n\t\t\t<td><input id="v5Sw7FddtKR-HllvX50cXC0-val" name="entryfield" title="WASH_Narrative-Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products" value="[ WASH_Narrative-Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="width:379px;">\n\t\t\t<p>Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members (Denominator - Total households ( of project catchment area) &nbsp;</p>\n\t\t\t</td>\n\t\t\t<td rowspan="3" style="width:92px;"><input id="Npx7xpJ9345-HllvX50cXC0-val" name="entryfield" title="WASH_Narrative-Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members" value="[ WASH_Narrative-Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="width:379px;"><span style="line-height: 23.1111px;"><strong>Numerator:</strong> Number of households with soap and water,&nbsp;</span></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="width: 379px;"><span style="line-height: 23.1111px;"><strong>Denominator:</strong> Total numberof households of project catchment area)</span></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="width: 379px;">\n\t\t\t<p><span style="color: rgb(34, 34, 34); font-family: LiberationSans, arial, sans-serif; font-size: 12px; line-height: 16.8px; background-color: rgb(252, 253, 253);">Custom: Number of individuals trained to implement improved sanitation methods</span></p>\n\t\t\t</td>\n\t\t\t<td style="width:92px;"><input id="hkk9zyk6xwy-HllvX50cXC0-val" name="entryfield" title="WASH_Narrative-Custom: Number of individuals trained to implement improved sanitation methods" value="[ WASH_Narrative-Custom: Number of individuals trained to implement improved sanitation methods ]" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n\n<p>&nbsp;</p>\n	2
556	iqpjg5IYeM8	\N	2017-01-27 13:34:15.371	2017-01-27 14:39:48.703	Malaria Narrative	NORMAL	<div id="tab-5">\n<table border="1" cellpadding="1" cellspacing="1" height="662" style="width:800px;" width="733">\n\t<tbody>\n\t\t<tr>\n\t\t\t<td colspan="4" style="text-align: center; background-color: rgb(102, 0, 153);">\n\t\t\t<h1><span style="color:#FFFFFF;"><span style="font-size:26px;">Malaria Narrative</span></span></h1>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>3.1.3.1-4</td>\n\t\t\t<td>\n\t\t\t<p>Number of artemisinin-based combination therapy (ACT) treatments purchased in any fiscal year with USG funds that were distributed in this reported fiscal year</p>\n\t\t\t</td>\n\t\t\t<td style="text-align: center;"><input id="Kj5B59Rswd4-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>3.1.3.1-8</td>\n\t\t\t<td>\n\t\t\t<p>Number of rapid diagnostic tests (RDTs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year</p>\n\t\t\t</td>\n\t\t\t<td style="text-align: center;"><input id="jO9qdoTvHD7-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="1" rowspan="4">3.1.3.2-3</td>\n\t\t\t<td rowspan="1" style="background-color: rgb(0, 51, 255);">\n\t\t\t<p><span style="color:#FFFFFF;"><strong>Number of insecticide treated nets (ITNs) purchased in any fiscal year with USG funds that were distributed in this reported fiscal year.</strong></span></p>\n\t\t\t</td>\n\t\t\t<td colspan="1" rowspan="4" style="text-align: center;"><input id="jcim8Yur0Yo-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong>Through campaigns</strong></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong>Through health facilities</strong></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong>Through the private/commercial sector</strong></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>3.1.3.3-3</td>\n\t\t\t<td>Number of houses sprayed with IRS with USG funds</td>\n\t\t\t<td style="text-align: center;"><input id="H4wDG7Sx4wV-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="1" rowspan="3">3.1.3.3-4</td>\n\t\t\t<td rowspan="1" style="background-color: rgb(0, 51, 255);">\n\t\t\t<p><span style="color:#FFFFFF;"><strong>Total number of residents of sprayed houses</strong></span></p>\n\t\t\t</td>\n\t\t\t<td colspan="1" rowspan="3" style="text-align: center;"><input id="L1xN9ygxGGJ-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong>Male</strong></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong>Female</strong></td>\n\t\t</tr>\n\t\t<tr height="40">\n\t\t\t<td height="60" rowspan="2" style="height:60px;width:59px;">3.1.3.1-3</td>\n\t\t\t<td rowspan="2" style="width:329px;">Number of artemisinin-based combination therapy (ACT) treatments purchased with USG funds</td>\n\t\t\t<td rowspan="2" style="width: 123px; text-align: center;"><input id="yUwWsdKDCTp-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t</tr>\n\t\t<tr height="40">\n\t\t\t<td height="40" style="height:40px;width:59px;">3.1.3.1-6</td>\n\t\t\t<td style="width:329px;">Number of malaria rapid diagnostic tests (RDTs) purchased with USG funds</td>\n\t\t\t<td style="width: 123px; text-align: center;"><input id="c43aWoYWmEv-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="40">\n\t\t\t<td height="40" style="height:40px;width:59px;">3.1.3.2-2</td>\n\t\t\t<td style="width:329px;">Number of insecticide treated (ITNs) purchased with USG funds</td>\n\t\t\t<td style="width: 123px; text-align: center;"><input id="zvXrHNHDo3V-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n</div>\n\n<p>&nbsp;</p>\n	2
560	brSTJXoLpjq	\N	2017-01-27 13:53:33.322	2017-01-27 13:53:33.322	WASH Target	NORMAL	<table border="1" cellpadding="1" cellspacing="1" style="width:800px;">\n\t<tbody>\n\t\t<tr>\n\t\t\t<th colspan="3" style="background-color: rgb(104, 70, 143);">\n\t\t\t<h2 style="text-align: -webkit-center;"><span style="color:#FFFFFF;"><strong><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><span style="line-height: 20.7999992370605px;">WASH Target</span></span></span></strong></span></h2>\n\t\t\t</th>\n\t\t</tr>\n\t\t<tr><!--<th colspan="1" rowspan="10" style="background-color: rgb(102, 51, 255);">--><!--<h2><span style="color:#FFFFFF;"><span style="font-size:14px;"><strong><span style="font-weight: normal;">3.1.6.1 Birth Preparedness and Maternity Services</span></strong></span></span></h2>--><!--</th>--><!--<td><span style="text-align: center;">Custom: Number of women who received at least 4 ANC visits during the  latest pregnancy during a specified time period (year)</td>-->\n\t\t\t<td style="text-align: center;"><strong>Indicator</strong></td>\n\t\t\t<th>Target</th>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="background-color: rgb(0, 0, 204);"><strong><span style="color:#ffffff;"><span style="text-align: center;">Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply</span></span></strong></td>\n\t\t\t<td>&nbsp;</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong><span style="text-align: center;">Males</span></strong></td>\n\t\t\t<td><input id="z2uZN0t05Nx-Evq43lpHFBO-val" name="entryfield" title="WASH_Target-Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply Male" value="[ WASH_Target-Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply Male ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong><span style="text-align: center;">Females</span></strong></td>\n\t\t\t<td><input id="z2uZN0t05Nx-zHSeMiszM8b-val" name="entryfield" title="WASH_Target-Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply Female" value="[ WASH_Target-Standard: 3.1.8.1-2 Number of people in target areas gaining access to improved drinking water supply Female ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="background-color: rgb(0, 0, 204);"><span style="text-align: center;"><strong><span style="color:#ffffff;">Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance (NOTE - SHOULD NOT INCLUDE NUMBERS FROM SCHOOLS AND HEALTH FACILITIES)</span></strong><period></period></span></td>\n\t\t\t<td>&nbsp;</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong><span style="text-align: center;">Males</span></strong></td>\n\t\t\t<td><input id="xztvU2Tceoy-Evq43lpHFBO-val" name="entryfield" title="WASH_Target-Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance Male" value="[ WASH_Target-Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance Male ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;"><strong><span style="text-align: center;">Females</span></strong></td>\n\t\t\t<td><input id="xztvU2Tceoy-zHSeMiszM8b-val" name="entryfield" title="WASH_Target-Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance Female" value="[ WASH_Target-Standard: 3.1.8.2-2 Number of people in target areas gaining access to improved sanitation facilities as a result of USG assistance Female ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p><span style="text-align: center;">Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings</span></p>\n\t\t\t</td>\n\t\t\t<td><input id="UO6pD5QxzOi-HllvX50cXC0-val" name="entryfield" title="WASH_Target-Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings" value="[ WASH_Target-Standard: 3.1.8.2-3 Number of improved toilets provided in institutional settings ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p><span style="text-align: center;">Standard: 3.1.6.8-5 Number of communities certified as &ldquo;open defecation free&rdquo; as a result of USG assistance</span></p>\n\t\t\t</td>\n\t\t\t<td><input id="LFedJLGIqkN-HllvX50cXC0-val" name="entryfield" title="WASH_Target-Standard: 3.1.6.8-5 Number of communities certified as -open defecation free- as a result of USG assistance" value="[ WASH_Target-Standard: 3.1.6.8-5 Number of communities certified as -open defecation free- as a result of USG assistance ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p><span style="text-align: center;">Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products</span></p>\n\t\t\t</td>\n\t\t\t<td><input id="siwS1HZGgVr-HllvX50cXC0-val" name="entryfield" title="WASH_Target-Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products" value="[ WASH_Target-Standard: 3.1.6.8-4 Number of liters of drinking water disinfected with point-of-use treatment products ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="width:379px;background-color: rgb(0, 102, 255);"><span style="color:#FFFFFF;"><strong>Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members (Denominator - Total households ( of project catchment area)</strong></span></td>\n\t\t\t<td style="width:92px;">&nbsp;</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="width:379px;"><span style="line-height: 20.8px;"><strong>Numerator</strong>: Number of households with soap and water.</span></td>\n\t\t\t<td style="width:92px;"><input id="ICZHF3s0V6X-IhtLhkHwYrQ-val" name="entryfield" title="WASH_Target-Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members Numerator" value="[ WASH_Target-Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members Numerator ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="width:379px;"><span style="line-height: 20.8px;"><strong>Denominator:</strong> Total numberof households of project catchment area.</span></td>\n\t\t\t<td style="width:92px;"><input id="ICZHF3s0V6X-G9dsIX6YwR6-val" name="entryfield" title="WASH_Target-Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members Denominator" value="[ WASH_Target-Standard: 3.1.6.8-1 Percentage of households with soap and water at a handwashing station commonly used by family members Denominator ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="width:379px;">\n\t\t\t<p>Custom: Number of individuals trained to implement improved sanitation methods:</p>\n\t\t\t</td>\n\t\t\t<td style="width:92px;"><input id="WS4omFo1DgY-HllvX50cXC0-val" name="entryfield" title="WASH_Target-Custom: Number of individuals trained to implement improved sanitation methods" value="[ WASH_Target-Custom: Number of individuals trained to implement improved sanitation methods ]" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n\n<p>&nbsp;</p>\n	2
576	klDUYFm0ru7	\N	2017-01-27 14:06:13.007	2017-01-27 14:29:41.423	Maternal and Child Health Target	NORMAL	<table border="1" cellpadding="1" cellspacing="1" style="width:800px;">\n\t<tbody>\n\t\t<tr>\n\t\t\t<th colspan="4" style="background-color: rgb(102, 0, 153);">\n\t\t\t<h1 style="text-align: -webkit-center;"><span style="font-size:16px;"><span style="color:#FFFFFF;"><strong><span style="font-family:arial,helvetica,sans-serif;"><span style="line-height: 20.7999992370605px;">Maternal and Child Health Target</span></span></strong></span></span></h1>\n\t\t\t</th>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1"><strong>Indicators</strong></td>\n\t\t\t<th>Target</th>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of women who received at least 4 ANC visits during the latest pregnancy during a specified time period (year)</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="osAT6WrYjLT-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of births in a given year attended by a skilled birth attendant (SBA) such as a doctor, nurse, or midwife</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="anjHkoHoJwI-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of women who had a live birth in the same specified period</span><span style="text-align: center;"> <period></period></span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="e9oWASlQzt9-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of children 12-23 months of age who received measles vaccine by the time they were 12 months of age:</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="BaZlUsrlVXP-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of children age 12-23 months of age who received third doses of DPT (Diptheria, Pertussis, Tetanus) vaccine:</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="UQm7qMjnIEZ-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of children who have received the third dose of pneumococcal conjugate vaccine by 12 months of age</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="S7beBW132zP-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Number of children under five fully immunized</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="dMxahS6FN6f-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of children under one year who receive three doses of OPV excluding birth polio</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="CzM4afuSRrt-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Number of living children Under 12 months</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="v76VqGBsP3l-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of children under five years old with diarrhea who received Oral Rehydration Therapy (ORT), defined as receiving Oral Rehydration Salt (ORS) solution</span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="hDMvvQNo8hn-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of children under five years of age who were ill with diarrhea </span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="o86Eexzbn85-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1">\n\t\t\t<p><span style="text-align: center;">Custom: Number of babies who received postnatal care within two days of childbirth in USG-supported programs </span></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" rowspan="1" style="text-align: center;"><input id="rESv9AsqpgQ-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" rowspan="1" style="background-color: rgb(0, 102, 255);"><span style="color:#FFFFFF;"><strong>Custom: Number of USG-supported facilities that provide appropriate life-saving maternity care(This will be defined as seven signal functions for BEmONC and nine signal functions for CEmONC):</strong></span></td>\n\t\t\t<td style="width: 93px; text-align: center;">&nbsp;</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td colspan="2" style="text-align: right;"><strong>BEmONC</strong></td>\n\t\t\t<td style="width: 93px; text-align: center;">\n\t\t\t<p><input id="qvJ7nQxudCX-I0q6bcGoQjP-val" name="entryfield" title="" value="" /></p>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: right;">\n\t\t\t<p><strong>CEmONC</strong></p>\n\t\t\t</td>\n\t\t\t<td colspan="2" style="width: 93px; text-align: center;"><input id="qvJ7nQxudCX-rcYc8tKldbt-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n\n<p>&nbsp;</p>\n	2
577	SkLT90CHXlo	\N	2017-01-27 14:12:13.687	2017-01-27 14:12:13.687	Nutrition Performance	NORMAL	<table border="1" cellpadding="1" cellspacing="1" style="width:800px;">\n\t<tbody>\n\t\t<tr>\n\t\t\t<td colspan="2" style="text-align: center; background-color: rgb(104, 70, 143);">\n\t\t\t<h1><span style="color:#FFFFFF;"><span style="font-size:26px;">Nutrition -Performance</span></span></h1>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: center;"><strong>Indicator</strong></td>\n\t\t\t<td style="text-align: center;"><b>Result</b></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Custom: Total number of children under five years</p>\n\t\t\t</td>\n\t\t\t<td><input id="LTTHsqlWfXG-HllvX50cXC0-val" name="entryfield" title="Nutrition_Performance_Custom: Total number of children under five years" value="[ Nutrition_Performance_Custom: Total number of children under five years ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Standard: 3.1.9-15 Number of children (under 5 yrs) reached by USG-supported nutrition programs</p>\n\t\t\t</td>\n\t\t\t<td><input id="vBY3ZXJIDC2-HllvX50cXC0-val" name="entryfield" title="Nutrition_Performance_Standard: 3.1.9-15 Number of children (under 5 yrs) reached by USG-supported nutrition programs" value="[ Nutrition_Performance_Standard: 3.1.9-15 Number of children (under 5 yrs) reached by USG-supported nutrition programs ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Custom: Number of children under five who are wasted</p>\n\t\t\t</td>\n\t\t\t<td><input id="lY71hYT1llA-HllvX50cXC0-val" name="entryfield" title="Nutrition_Performance_Custom: Number of children under five who are wasted" value="[ Nutrition_Performance_Custom: Number of children under five who are wasted ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Custom: Number of children under five who are Underweight&nbsp;</p>\n\t\t\t</td>\n\t\t\t<td><input id="xQc3fk7Ei26-HllvX50cXC0-val" name="entryfield" title="Nutrition_Performance_Custom: Number of children under five who are Underweight" value="[ Nutrition_Performance_Custom: Number of children under five who are Underweight ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Standard: 3.1.9.2-3 Number of children under 5 years of age who received Vitamin A from USG-supported programs</p>\n\t\t\t</td>\n\t\t\t<td><input id="WSiazJVzL1z-HllvX50cXC0-val" name="entryfield" title="Nutrition_Performance_Standard: 3.1.9.2-3 Number of children under 5 years of age who received Vitamin A from USG-supported programs" value="[ Nutrition_Performance_Standard: 3.1.9.2-3 Number of children under 5 years of age who received Vitamin A from USG-supported programs ]" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n\n<p>&nbsp;</p>\n	2
578	T8vghvcdWXJ	\N	2017-01-27 14:15:04.568	2017-01-27 14:15:04.568	Nutrition Target	NORMAL	<table border="1" cellpadding="1" cellspacing="1" style="width:800px;">\n\t<tbody>\n\t\t<tr>\n\t\t\t<td colspan="2" style="text-align: center; background-color: rgb(104, 70, 143);">\n\t\t\t<h1><span style="color:#FFFFFF;"><span style="font-size:26px;">Nutrition Target</span></span></h1>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td height="20" style="height: 20px; width: 379px;">Standard: 3.1.9.2-2 Number of health facilities with established capacity to manage acute under-nutrition</td>\n\t\t\t<td style="width:141px;"><input id="ST9KsMP3aOy-HllvX50cXC0-val" name="entryfield" title="Nutrition_Target_Standard: 3.1.9.2-2 Number of health facilities with established capacity to manage acute under-nutrition" value="[ Nutrition_Target_Standard: 3.1.9.2-2 Number of health facilities with established capacity to manage acute under-nutrition ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Custom: Total number of children under five years</p>\n\t\t\t</td>\n\t\t\t<td><input id="J7T6ltujYx7-HllvX50cXC0-val" name="entryfield" title="Nutrition_Target_Custom: Total number of children under five years" value="[ Nutrition_Target_Custom: Total number of children under five years ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Standard: 3.1.9-15 Number of children (under 5 yrs) reached by USG-supported nutrition programs</p>\n\t\t\t</td>\n\t\t\t<td><input id="hA56P2gM6Uf-HllvX50cXC0-val" name="entryfield" title="Nutrition_Target_Standard: 3.1.9-15 Number of children (under 5 yrs) reached by USG-supported nutrition programs" value="[ Nutrition_Target_Standard: 3.1.9-15 Number of children (under 5 yrs) reached by USG-supported nutrition programs ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Custom: Number of children under five who are wasted</p>\n\t\t\t</td>\n\t\t\t<td><input id="G6TbhAofOJg-HllvX50cXC0-val" name="entryfield" title="Nutrition_Target_Custom: Number of children under five who are wasted" value="[ Nutrition_Target_Custom: Number of children under five who are wasted ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Custom: Number of children under five who are Underweight&nbsp;</p>\n\t\t\t</td>\n\t\t\t<td><input id="Gg5QNicshDD-HllvX50cXC0-val" name="entryfield" title="Nutrition_Target_Custom: Number of children under five who are Underweight" value="[ Nutrition_Target_Custom: Number of children under five who are Underweight ]" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Standard: 3.1.9.2-3 Number of children under 5 years of age who received Vitamin A from USG-supported programs</p>\n\t\t\t</td>\n\t\t\t<td><input id="mbY9ZLZ2rxK-HllvX50cXC0-val" name="entryfield" title="Nutrition_Target_Standard: 3.1.9.2-3 Number of children under 5 years of age who received Vitamin A from USG-supported programs" value="[ Nutrition_Target_Standard: 3.1.9.2-3 Number of children under 5 years of age who received Vitamin A from USG-supported programs ]" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n\n<p>&nbsp;</p>\n	2
527	Mqv3ta9krwE	\N	2017-01-27 13:21:19.094	2017-01-27 14:39:08.5	Family Planning and Reproductive Health Narrative	NORMAL	<table border="1" cellpadding="1" cellspacing="1" style="width:800px;">\n\t<tbody>\n\t\t<tr>\n\t\t\t<td colspan="2" style="text-align: center; background-color: rgb(153, 51, 255);">\n\t\t\t<h1><span style="color:#FFFFFF;">Family Planning and Reproductive Health Narrative</span></h1>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: center;"><strong>Indicators</strong></td>\n\t\t\t<td style="text-align: center;"><strong>Narrative</strong></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td height="40" style="height:40px;width:389px;">Standard: 3.1.7.1-1 Couple-years of protection (CYP) in USG-supported programs</td>\n\t\t\t<td style="width: 132px; text-align: center;"><input id="C0DWzot17Xy-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="background-color: rgb(0, 0, 204);">\n\t\t\t<p><strong><span style="color:#ffffff;">Standard: 3.1.7.1-2 Percent of service delivery points (SDP) that experience stock out at any time during the reporting period of a contraceptive method that the SDP is expected to provide</span></strong></p>\n\t\t\t</td>\n\t\t\t<td colspan="1" rowspan="3" style="white-space: nowrap; text-align: center;"><input id="ucjHtFFfjEZ-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td><strong>Numerator</strong>: Number of service delivery sites providing family planning(FP) counselling and/or services</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td><strong>Denominator</strong>: Number of service delivery points (SDP) that experience stock out at any time during the reporting period of a contraceptive method that the SDP is expected to provide</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Standard: 3.1.7.1-4 Number of additional USG-assisted community health workers (CHWs) providing family planning (FP) information</p>\n\t\t\t</td>\n\t\t\t<td><input id="e2MAgb5u6Su-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Custom: Percent increase on contraceptive commodity reporting rates</p>\n\t\t\t</td>\n\t\t\t<td><input id="nIxIY6oXZz0-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="60">\n\t\t\t<td height="60" style="height:60px;width:389px;">Custom: Number&nbsp; of new policies developed with USG assistance to improve access and use of FP/RH, MCH and Nutrition services, by stage of development</td>\n\t\t\t<td style="width:132px;"><input id="FWWoDxKlXRg-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="60">\n\t\t\t<td height="60" style="height:60px;width:389px;">Custom: Number of new Guidelines or Strategic Plans developed with USG assistance to improve access to and use of FP/RH</td>\n\t\t\t<td style="width:132px;"><input id="RXwOwGXICBe-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="40">\n\t\t\t<td height="40" style="height:40px;width:389px;">\n\t\t\t<p>Custom: Number of policies or guidelines developed or changed to improve access to and use of FP/RH services</p>\n\t\t\t</td>\n\t\t\t<td style="width:132px;"><input id="a5JH70aUwTP-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n\n<p>&nbsp;</p>\n	2
555	UjlQS5KjhqF	\N	2017-01-27 13:28:26.253	2017-01-27 14:39:34	Family Planning and Reproductive Health Target	NORMAL	<table border="1" cellpadding="1" cellspacing="1" style="width:800px;">\n\t<tbody>\n\t\t<tr>\n\t\t\t<td colspan="2" style="text-align: center; background-color: rgb(153, 51, 255);">\n\t\t\t<h1><span style="color:#FFFFFF;">Family Planning and Reproductive Health Target</span></h1>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="text-align: center;"><strong>Indicators</strong></td>\n\t\t\t<td style="text-align: center;"><strong>Annual Target</strong></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td height="40" style="height:40px;width:389px;">\n\t\t\t<p>Standard: 3.1.7.1-1 Couple-years of protection (CYP) in USG-supported programs</p>\n\t\t\t</td>\n\t\t\t<td style="width:132px;"><input id="AjQLlfjNZL6-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="background-color: rgb(0, 0, 204);">\n\t\t\t<p><span style="color:#ffffff;">Standard: 3.1.7.1-2 Percent of service delivery points (SDP) that experience stock out at any time during the reporting period of a contraceptive method that the SDP is expected to provide</span></p>\n\t\t\t</td>\n\t\t\t<td>&nbsp;</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p><strong>Numerator</strong>: <span style="line-height: 23.1111px;">Number of service delivery points (SDP) that experience stock out at any time during the reporting period of a contraceptive method that the SDP is expected to provide</span></p>\n\t\t\t</td>\n\t\t\t<td><input id="xVzGmAXrv0C-IhtLhkHwYrQ-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p><strong>Denominator</strong>:&nbsp;<span style="line-height: 23.1111px;">Number of service delivery sites providing family planning(FP) counselling and/or services</span></p>\n\t\t\t</td>\n\t\t\t<td><input id="xVzGmAXrv0C-G9dsIX6YwR6-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<p>Standard: 3.1.7.1-4 Number of additional USG-assisted community health workers (CHWs) providing family planning (FP) information</p>\n\t\t\t</td>\n\t\t\t<td><input id="zo6UW9Ou6ak-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="60">\n\t\t\t<td height="60" style="height:60px;width:389px;">Custom: Number&nbsp; of new policies developed with USG assistance to improve access and use of FP/RH, MCH and Nutrition services, by stage of development:</td>\n\t\t\t<td style="width:132px;"><input id="Kg46HxvJBRG-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="60">\n\t\t\t<td height="60" style="height:60px;width:389px;">Custom: Number of new Guidelines or Strategic Plans developed with USG assistance to improve access to and use of FP/RH:</td>\n\t\t\t<td style="width:132px;"><input id="Mdkd9fMQ5Hs-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="40">\n\t\t\t<td height="40" style="height:40px;width:389px;">Custom: Number of policies or guidelines developed or changed to improve access to and use of FP/RH services :</td>\n\t\t\t<td style="width:132px;"><input id="LtvUWDeywUM-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td height="40" style="height:40px;width:389px;"><span style="line-height: 23.1111px;">Custom: Percent increase on contraceptive commodity reporting rates</span></td>\n\t\t\t<td style="width:132px;"><input id="NIZxsTaJLNy-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td height="40" style="height:40px;width:389px;">Pregnant women attending four ANC visits</td>\n\t\t\t<td style="width:132px;">&nbsp;</td>\n\t\t</tr>\n\t</tbody>\n</table>\n\n<p>&nbsp;</p>\n	2
981	HPtqhGK30Ie	\N	2017-01-27 18:32:11.565	2017-01-27 18:45:56.309	Training Narrative	NORMAL	<script>\n\njQuery(document).ready( function() {\n\n          jQuery( '#tabs' ).tabs({ collapsible : true });\n\n    });\n\n</script>\n<style type="text/css">.floatingHeader {\n      position: fixed;\n      top: 45px;\n      width:96%;\n      visibility: hidden;\n    }\n\n  td, th{\n       /* css-3 */\n       white-space: -o-pre-wrap;\n       word-wrap: break-word;\n       white-space: pre-wrap;\n       white-space: -moz-pre-wrap;\n       white-space: -pre-wrap;\n\n   }\n\n.container-content{\n    width:96%;\n    overflow-x: auto;\n    white-space: nowrap;\n}\n\n\n\n*{\n  margin: 0;\n  padding: 0;\n}\nbody {\n  font: 14px Georgia, serif;\n}\nh1 {\n  font: 32px Georgia, Serif;\n  margin: 0 0 20px 0;\n}\np {\n  margin: 0 0 20px 0;\n}\n#page-wrap {\n  width: 500px;\n  margin: 100px auto;\n}\n.spacer {\n  height: 600px;\n}\ntable {\n  border-collapse: collapse;\n}\nth {\n  background-color: lightgrey;\n  padding: 10px;\n  width: 200px;\n  text-align: left;\n}\ntr:nth-child(odd) {\n  background: #eee;\n}\ntd {\n  padding: 10px;\n  width: 200px;\n}\n\n.some-other-area {\n  margin: 300px 0;\n  line-height: 2;\n}\nh2 {\n  background: lightgrey;\n  padding: 10px;\n  font: 28px Georgia, Serif;\n  margin: 0 0 20px 0;\n}\n</style>\n<style type="text/css">table.tableizer-table {\n        font-size: 12px;\n        border: 1px solid #CCC;\n        font-family: Arial, Helvetica, sans-serif;\n    }\n    .tableizer-table td {\n        padding: 4px;\n        margin: 3px;\n        border: 1px solid #CCC;\n    }\n    .tableizer-table th {\n        background-color: #104E8B;\n        color: #FFF;\n        font-weight: bold;\n    }\n\n.ui-widget, .ui-widget input, .ui-widget select, .ui-widget textarea, .ui-widget button\n{\n  font-family: LiberationSans, arial, sans-serif !important;\n  font-size: 9pt !important;\n}\n</style>\n<div id="tabs">\n<ul>\n\t<li><a href="#tab-1">FPRH, Nutrition, MCH and WASH</a></li>\n\t<li><a href="#tab-2">HRH indicators</a></li>\n</ul>\n\n<div class="container-content" id="tab-1">\n<table border="1" class="tableizer-table persist-area">\n\t<thead>\n\t\t<tr>\n\t\t\t<td><strong>Training Indicator&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></td>\n\t\t\t<td><strong>Narrative</strong></td>\n\t\t</tr>\n\t</thead>\n\t<tbody>\n\t\t<tr height="20">\n\t\t\t<td>Number of people trained in malaria treatment or prevention</td>\n\t\t\t<td><input id="w9ENmdRIGfK-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>Number of people trained in Malaria monitoring and evaluation with USG assistance</td>\n\t\t\t<td><input id="duFD1sb1djC-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>Number of people trained in maternal and/or newborn health and nutrition care through USG-supported program</td>\n\t\t\t<td><input id="zdKpP0nVubN-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>Number of people trained in child health care and nutrition through USG-supported health area programs&nbsp;</td>\n\t\t\t<td><input id="XfGmkfl59Gw-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance</td>\n\t\t\t<td><input id="zQbYWDaNw3e-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>Number of people trained in FP/RH&nbsp; with USG funds:</td>\n\t\t\t<td><input id="OLgOjjtvE8U-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance:</td>\n\t\t\t<td><input id="m9KKfM5A5Qs-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>Number of individuals trained to implement improved sanitation methods</td>\n\t\t\t<td><input id="aTBVOlhbUpA-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>Nutrition: Number of Community health workers trained in child health and/or nutrition</td>\n\t\t\t<td><input id="NAZFcpl01yH-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>H2.1D: Number of new health care workers who graduated from a pre‐service training institution&nbsp;</td>\n\t\t\t<td><input id="hDI9o8Z5U76-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>Custom: Total number of CHWs trained in family planning counselling services through USG supported programs:</td>\n\t\t\t<td><input id="V5EY1Yz9VWS-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>Custom: Total number of health workers trained in commodity management through USG supported programs:</td>\n\t\t\t<td><input id="mmaxpstsbDW-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>MCH-Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported program</td>\n\t\t\t<td><input id="gv0OUl0eKwZ-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>MCH-Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs</td>\n\t\t\t<td><input id="GI5xfHrUqGB-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>FPRH-Custom: Total number of health workers trained in FP/RH through in-service training</td>\n\t\t\t<td><input id="Mtwe9SzJg11-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>Malaria-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds</td>\n\t\t\t<td><input id="SmIFZ4loupz-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>Malaria-Number of people trained with USG funds to deliver indoor residual spraying (IRS)</td>\n\t\t\t<td><input id="DwIq31tjw0i-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>Malaria-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds</td>\n\t\t\t<td><input id="yLH4XfU0eM3-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n\n<p>&nbsp;</p>\n</div>\n\n<div class="container-content" id="tab-2">\n<table border="1" class="tableizer-table persist-area">\n\t<thead>\n\t\t<tr>\n\t\t\t<td><strong>Training Indicator&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></td>\n\t\t\t<td><strong>Narrative</strong></td>\n\t\t</tr>\n\t</thead>\n\t<tbody>\n\t\t<tr height="20">\n\t\t\t<td>H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program</td>\n\t\t\t<td><input id="iBu3DhYr92Y-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision</td>\n\t\t\t<td><input id="KjZpwmnEab2-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment</td>\n\t\t\t<td><input id="slWG1x3wtyT-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL</td>\n\t\t\t<td><input id="akzXrr1WpJb-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n</div>\n</div>\n	2
833	OyI3aCCg6eP	\N	2017-01-27 17:04:38.196	2017-01-27 19:16:18.829	Training Performance	NORMAL	<script>\n\njQuery(document).ready( function() {\n\n          jQuery( '#tabs' ).tabs({ collapsible : true });\n\n    });\n\n</script>\n<style type="text/css">.floatingHeader {\n      position: fixed;\n      top: 45px;\n      width:96%;\n      visibility: hidden;\n    }\n\n  td, th{\n       /* css-3 */\n       white-space: -o-pre-wrap;\n       word-wrap: break-word;\n       white-space: pre-wrap;\n       white-space: -moz-pre-wrap;\n       white-space: -pre-wrap;\n\n   }\n\n.container-content{\n    width:96%;\n    overflow-x: auto;\n    white-space: nowrap;\n}\n\n\n\n*{\n  margin: 0;\n  padding: 0;\n}\nbody {\n  font: 14px Georgia, serif;\n}\nh1 {\n  font: 32px Georgia, Serif;\n  margin: 0 0 20px 0;\n}\np {\n  margin: 0 0 20px 0;\n}\n#page-wrap {\n  width: 500px;\n  margin: 100px auto;\n}\n.spacer {\n  height: 600px;\n}\ntable {\n  border-collapse: collapse;\n}\nth {\n  background-color: lightgrey;\n  padding: 10px;\n  width: 200px;\n  text-align: left;\n}\ntr:nth-child(odd) {\n  background: #eee;\n}\ntd {\n  padding: 10px;\n  width: 200px;\n}\n\n.some-other-area {\n  margin: 300px 0;\n  line-height: 2;\n}\nh2 {\n  background: lightgrey;\n  padding: 10px;\n  font: 28px Georgia, Serif;\n  margin: 0 0 20px 0;\n}\n</style>\n<style type="text/css">table.tableizer-table {\n        font-size: 12px;\n        border: 1px solid #CCC;\n        font-family: Arial, Helvetica, sans-serif;\n    }\n    .tableizer-table td {\n        padding: 4px;\n        margin: 3px;\n        border: 1px solid #CCC;\n    }\n    .tableizer-table th {\n        background-color: #104E8B;\n        color: #FFF;\n        font-weight: bold;\n    }\n\n.ui-widget, .ui-widget input, .ui-widget select, .ui-widget textarea, .ui-widget button\n{\n  font-family: LiberationSans, arial, sans-serif !important;\n  font-size: 9pt !important;\n}\n</style>\n<div id="tabs">\n<ul>\n\t<li><a href="#tab-1">FPRH, Nutrition, MCH and WASH</a></li>\n\t<li><a href="#tab-2">HRH indicators</a></li>\n</ul>\n\n<div class="container-content" id="tab-1">\n<table border="1" class="tableizer-table persist-area">\n\t<thead>\n\t\t<tr>\n\t\t\t<td><strong>Training Indicator&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></td>\n\t\t\t<td><strong>Male</strong></td>\n\t\t\t<td><strong>Female</strong></td>\n\t\t\t<td><strong>Days Trained</strong></td>\n\t\t\t<td><strong>Start Date</strong></td>\n\t\t\t<td><strong>End date</strong></td>\n\t\t\t<td><strong>Cadre Trained</strong></td>\n\t\t\t<td><strong>Curriculum Used</strong></td>\n\t\t</tr>\n\t</thead>\n\t<tbody>\n\t\t<tr height="20">\n\t\t\t<td>Number of people trained in malaria treatment or prevention</td>\n\t\t\t<td><input id="WLius6ciXLA-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="WLius6ciXLA-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="wEPLHbCjtGE-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="guqKSplwJ1f-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="GdEpZbPzYhF-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="qbIEMdqX6SC-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="R9JnZvLTClm-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>Number of people trained in Malaria monitoring and evaluation with USG assistance</td>\n\t\t\t<td><input id="gXj3q9OhwyW-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="gXj3q9OhwyW-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="hVfOVIup2yk-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="OpnKX6iBOpk-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="kbmyxoBXRZo-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="AxGOLjw4C0e-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="Jg569TtEhGz-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>Number of people trained in maternal and/or newborn health and nutrition care through USG-supported program</td>\n\t\t\t<td><input id="sPtMkz7edyy-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="sPtMkz7edyy-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="GuxRscJY6hP-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="SE2QJpLSdcJ-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="cf5K8xl1xn5-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="VIzB80nnqCk-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="qF9xWbHaW6H-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>Number of people trained in child health care and nutrition through USG-supported health area programs&nbsp;</td>\n\t\t\t<td><input id="SlzLZlX6idE-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="SlzLZlX6idE-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="sTZbdHo3RRN-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="AnVLIlepgFc-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="Mzi18XpfkhH-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="vAIDHV0jv7o-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="wmfCwInEHGH-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>Number of people trained in Maternal and Child Health monitoring and evaluation with USG assistance</td>\n\t\t\t<td><input id="BdODm3EDRVG-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="BdODm3EDRVG-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="yCEJ3ShJnEv-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="bps4V2emQ1X-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="ONC1VdrdDRQ-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="U2sQqGUYnwO-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="u7Qi0Vs1OWl-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>Number of people trained in FP/RH&nbsp; with USG funds:</td>\n\t\t\t<td><input id="ugBEsOsXXyP-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="ugBEsOsXXyP-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="AeiOIfIUpct-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="TMcbj8KuzCs-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="iSNRN5gqO8B-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="ejs9QXdm5R6-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="VGxlSe40hWD-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>Number of people trained in Family Planning and Reproductive Health monitoring and evaluation with USG assistance:</td>\n\t\t\t<td><input id="ExaxTDDCrlv-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="ExaxTDDCrlv-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="ucgWJCxwjiw-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="EFCblXGSis7-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="fJITcrgepxq-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="wW6HfUiVxHr-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="HdQLymv1zjg-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>Number of individuals trained to implement improved sanitation methods</td>\n\t\t\t<td><input id="doe1BiQQ7je-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="doe1BiQQ7je-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="aUDRATag9kU-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="uAmBFcuPc3c-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="nFACrUPVL6m-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="harLw7cj0Il-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="ANijMjqsGu7-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>Nutrition: Number of Community health workers trained in child health and/or nutrition</td>\n\t\t\t<td><input id="Kpku2CRlkIi-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="Kpku2CRlkIi-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="BtGQ7LMtsEL-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="Tj0u0IZncvp-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="RLveb9oGbTx-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="QbRZ3AmYyMd-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="qeefDXTqSEa-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>H2.1D: Number of new health care workers who graduated from a pre‐service training institution&nbsp;</td>\n\t\t\t<td><input id="pJDO9rjQl90-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="pJDO9rjQl90-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="zyTbBcreQAL-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="VtKx3I1SDKg-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="xzEsJJdRcDR-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="bfV72a0BbvN-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="c5qW8syVInh-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>Custom: Total number of CHWs trained in family planning counselling services through USG supported programs:</td>\n\t\t\t<td><input id="Iz357ps1KKa-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="Iz357ps1KKa-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="ejTBmc4lYFE-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="wugtKtXgmR4-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="IUSJ3ivbDQs-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="tHovSR0Sna9-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="QZFtEEJsdqM-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>Custom: Total number of health workers trained in commodity management through USG supported programs:</td>\n\t\t\t<td><input id="oXdh3orGb6V-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="oXdh3orGb6V-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="LxiQNEwaDLg-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="dIRBDxfD6g2-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="KVrGaiS9EPf-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="oHodhC7abPr-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="CxtnoK8xPF1-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>MCH-Custom: Number of health service providers trained in maternal and/or newborn health and nutrition care through USG supported program</td>\n\t\t\t<td><input id="eQMiyC86fWH-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="eQMiyC86fWH-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="DvndGk9dQmD-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="WCXPX4S0E9Y-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="WzuOkW7VvdB-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="qlGWKNFID1E-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="Zyf69ag02Qa-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>MCH-Custom: Total number of Community Health Workers (CHWs) trained in maternal and/or newborn health through USG supported programs</td>\n\t\t\t<td><input id="pIEepIJkZxM-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="pIEepIJkZxM-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="rEvvz5cBa6n-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="F31woXDWk8K-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="GyPkQkcAHMO-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="UZ4tA5SMd16-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="ak257MHZ9D8-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>FPRH-Custom: Total number of health workers trained in FP/RH through in-service training</td>\n\t\t\t<td><input id="KYOenT42vIX-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="KYOenT42vIX-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="fLx12zonFDN-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="PsMjvCAiobZ-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="CN8drrDhGQC-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="l7j9KgHhfes-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="pXv0QUpuuWN-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>Malaria-Number of health workers trained in malaria laboratory diagnostics (rapid diagnostic tests (RDTs) or microscopy) with USG funds</td>\n\t\t\t<td><input id="V94EunQYnIb-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="V94EunQYnIb-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="k68I4dD2llz-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="Yuw8CQQ5EM1-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="zuNC3T0Rbcy-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="DSwm3J4jSdB-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="XA0Bixoseya-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>Malaria-Number of people trained with USG funds to deliver indoor residual spraying (IRS)</td>\n\t\t\t<td><input id="AWWr6X4ueHE-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="AWWr6X4ueHE-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="bxmq5q9a1R1-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="ptmYSGVRC9G-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="ZzRAEwMzaLD-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="lcGGcLmqeqt-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="UA0dnYsqFMC-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>Malaria-Number of health workers trained in intermittent preventive treatment in pregnancy( IPTp) with USG funds</td>\n\t\t\t<td><input id="zpBU6rGw28o-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="zpBU6rGw28o-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="GBPr5BqtOW4-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="OzAydBGHVVI-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="PKEyefS3A61-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="HZCpsw3gqU6-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="UdoeEKC7K2d-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n\n<p>&nbsp;</p>\n</div>\n\n<div class="container-content" id="tab-2">\n<table border="1" class="tableizer-table persist-area">\n\t<thead>\n\t\t<tr>\n\t\t\t<td><strong>Training Indicator&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></td>\n\t\t\t<td><strong>Male</strong></td>\n\t\t\t<td><strong>Female</strong></td>\n\t\t\t<td><strong>Days Trained</strong></td>\n\t\t\t<td><strong>Start Date</strong></td>\n\t\t\t<td><strong>End Date</strong></td>\n\t\t\t<td><strong>Cadre Trained</strong></td>\n\t\t\t<td><strong>Curriculum Used</strong></td>\n\t\t</tr>\n\t</thead>\n\t<tbody>\n\t\t<tr height="20">\n\t\t\t<td>H2.2.D: Number of community health and para‐social workers who successfully completed a pre‐service training program</td>\n\t\t\t<td><input id="ssuYEerQOvu-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="ssuYEerQOvu-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="p5pCS0s7DJB-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="QtaSE7ng9pA-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="G9I3ALK2ZmY-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="g0djjCN1opI-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="WuGTzdNP4Mv-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>H2.3.DMC: Number of health care workers who successfully completed an in‐service training program Male Circumcision</td>\n\t\t\t<td><input id="GZCTmtVMyGr-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="GZCTmtVMyGr-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="ZmN3kFMZhhc-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="za1TiT2bTU0-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="nvb1vWjWlEE-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="RpgQFVll9kU-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="oeB8Hgat26P-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>H2.3.DPT: Number of health care workers who successfully completed an in‐service training program Pediatric Treatment</td>\n\t\t\t<td><input id="E7PVXbISFt6-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="E7PVXbISFt6-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="fY8a5YL3OW6-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="zz4jNq3YxyQ-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="w5xYBW1gVAS-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="z1rxPgSBQqb-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="iuyNlF7WImQ-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t\t<tr height="20">\n\t\t\t<td>H2.3.D: Number of health care workers who successfully completed an in‐service training program TOTAL</td>\n\t\t\t<td><input id="vzOcibT8QzW-Evq43lpHFBO-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="vzOcibT8QzW-zHSeMiszM8b-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="AG4mUXMUPIl-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="ZTl9W0gsPmJ-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="TcY4OTU4xDO-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="gbUCXsRatgH-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t\t<td><input id="TlLF1LReZbm-HllvX50cXC0-val" name="entryfield" title="" value="" /></td>\n\t\t</tr>\n\t</tbody>\n</table>\n</div>\n</div>\n	2
\.


--
-- Data for Name: dataentryformtranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataentryformtranslations (dataentryformid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY dataset (datasetid, uid, code, created, lastupdated, name, shortname, description, periodtypeid, categorycomboid, dataentryform, mobile, version, expirydays, timelydays, startdate, enddate, notifycompletinguser, workflowid, openfutureperiods, fieldcombinationrequired, validcompleteonly, novaluerequirescomment, skipoffline, dataelementdecoration, renderastabs, renderhorizontally, legendsetid, userid, publicaccess, notificationrecipients) FROM stdin;
309	sYzBjppzXXf	MCH Performance	2017-01-27 11:33:43.992	2017-01-27 14:34:06.078	Maternal and Child Health Performance	Maternal and Child Health Performance	\N	3	14	441	f	4	0	15	\N	\N	f	\N	0	f	f	f	f	f	f	f	\N	46	rw------	\N
321	NrsW7eWY0gy	MCH Target	2017-01-27 11:35:08.813	2017-01-27 14:34:14.335	Maternal and Child Health Target	Maternal and Child Health Target	\N	3	14	576	f	3	0	15	\N	\N	f	\N	0	f	f	f	f	f	f	f	\N	46	rw------	\N
479	U89pSwVbyyR	\N	2017-01-27 12:37:02.256	2017-01-27 18:42:10.561	National Performance	National Performance	National Performance	7	14	517	f	2	0	15	\N	\N	f	\N	1	f	f	f	f	f	f	f	\N	46	rw------	\N
957	nuNWPPZi58G	\N	2017-01-27 18:23:58.065	2017-01-27 18:45:56.315	Training Narrative	Training Narrative	Training Narrative	7	14	981	f	2	0	15	\N	\N	f	\N	1	f	f	f	f	f	f	f	\N	46	rw------	\N
359	Fn16S3qhaUI	Nutrition Narrative	2017-01-27 11:38:04.707	2017-01-27 14:34:56.591	Nutrition Narrative	Nutrition Narrative	\N	3	14	579	f	1	0	15	\N	\N	f	\N	0	f	f	f	f	f	f	f	\N	46	rw------	\N
450	xYBGIig02eY	\N	2017-01-27 12:13:33.388	2017-01-27 14:35:07.749	WASH Narrative	WASH Narrative	WASH Narrative	7	14	559	f	1	0	15	\N	\N	f	\N	0	f	f	f	f	f	f	f	\N	46	rw------	\N
425	f33Mg5vc5vW	\N	2017-01-27 12:10:03.042	2017-01-27 14:35:39.634	WASH Performance	WASH Performance	WASH Performance	7	14	558	f	1	0	15	\N	\N	f	\N	1	f	f	f	f	f	f	f	\N	46	rw------	\N
433	NRrZJGyBb1R	\N	2017-01-27 12:12:01.076	2017-01-27 14:35:53.315	WASH Target	WASH Target	WASH Target	8	14	560	f	1	0	15	\N	\N	f	\N	1	f	f	f	f	f	f	f	\N	46	rw------	\N
345	zJFqCilzGQA	Nutrition Performance	2017-01-27 11:36:59.159	2017-01-27 14:36:04.814	Nutrition Performance	Nutrition Performance	\N	3	14	577	f	1	0	15	\N	\N	f	\N	0	f	f	f	f	f	f	f	\N	46	rw------	\N
352	PyibXjyo7HD	Nutrition Target	2017-01-27 11:37:32.187	2017-01-27 14:36:16.56	Nutrition Target	Nutrition Target	\N	3	14	578	f	1	0	15	\N	\N	f	\N	0	f	f	f	f	f	f	f	\N	46	rw------	\N
469	moPMP5uLzYQ	\N	2017-01-27 12:31:52.67	2017-01-27 18:48:02.718	County Performance	County Performance	County Performance	7	14	520	f	4	0	15	\N	\N	f	\N	1	f	f	f	f	f	f	f	\N	46	rw------	\N
281	UOVMUReo5Qz	\N	2017-01-27 11:00:05.802	2017-01-27 14:39:08.505	Family Planning and Reproductive Health Narrative	Family Planning and Reproductive Health Narrative	Family Planning and Reproductive Health Narrative	7	14	527	f	3	0	15	\N	\N	f	\N	1	f	f	f	f	f	f	f	\N	46	rw------	\N
466	B4o5gAAVqjp	\N	2017-01-27 12:17:25.706	2017-01-27 14:39:20.409	Family Planning and Reproductive Health Performance	Family Planning and Reproductive	Family Planning and Reproductive Health Performance	7	14	528	f	2	0	15	\N	\N	f	\N	1	f	f	f	f	f	f	f	\N	46	rw------	\N
301	XSfxBtCiOhy	\N	2017-01-27 11:27:27.552	2017-01-27 14:39:34.006	Family Planning and Reproductive Health Target	Family Planning and Reproductive Health Target	Family Planning and Reproductive Health Target	6	14	555	f	2	1	15	\N	\N	f	\N	1	f	f	f	f	f	f	f	\N	46	rw------	\N
712	hSZ19zapkx8	\N	2017-01-27 16:54:57.529	2017-01-27 19:16:18.834	Training Performance	Training Performance	Training Performance	3	14	833	f	5	0	15	\N	\N	f	\N	0	f	f	f	f	f	f	f	\N	46	rw------	\N
416	jLXlEJgLv5V	\N	2017-01-27 11:58:29.499	2017-01-27 14:39:48.707	Malaria Narrative	Malaria Narrative	Malaria Narrative	7	14	556	f	2	0	15	\N	\N	f	\N	1	f	f	f	f	f	f	f	\N	46	rw------	\N
407	f4LiKRi7omQ	\N	2017-01-27 11:56:12.252	2017-01-27 14:33:37.057	Malaria Target	Malaria Target	Malaria Target	8	14	557	f	1	0	15	\N	\N	f	\N	1	f	f	f	f	f	f	f	\N	46	rw------	\N
333	BmRYO7BH9Gm	MCH Narrative	2017-01-27 11:35:56.254	2017-01-27 14:33:53.145	Maternal and Child Health Narrative	Maternal and Child Health Narrative	\N	3	14	529	f	2	0	15	\N	\N	f	\N	0	f	f	f	f	f	f	f	\N	46	rw------	\N
\.


--
-- Data for Name: datasetattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY datasetattributevalues (datasetid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: datasetelement; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY datasetelement (datasetelementid, uid, code, created, lastupdated, datasetid, dataelementid, categorycomboid) FROM stdin;
632	BjyYptarMGF	\N	2017-01-27 14:34:06.054	2017-01-27 14:34:06.054	309	491	\N
633	oKNbcxtNLnF	\N	2017-01-27 14:34:06.054	2017-01-27 14:34:06.054	309	478	\N
634	Lu8wkvL2Qn0	\N	2017-01-27 14:34:06.054	2017-01-27 14:34:06.054	309	254	\N
635	owpee0gj5LO	\N	2017-01-27 14:34:06.054	2017-01-27 14:34:06.054	309	255	\N
580	HX9F1Q6drNA	\N	2017-01-27 14:32:26.304	2017-01-27 14:32:26.304	469	378	\N
581	GBUxdyEH2Nd	\N	2017-01-27 14:32:26.304	2017-01-27 14:32:26.304	469	386	\N
582	uwAogMXciNX	\N	2017-01-27 14:32:26.304	2017-01-27 14:32:26.304	469	257	\N
583	ovFIhqlFg6t	\N	2017-01-27 14:32:26.304	2017-01-27 14:32:26.304	469	385	\N
636	oMq4kJhlwPp	\N	2017-01-27 14:34:06.054	2017-01-27 14:34:06.054	309	253	\N
637	Q6GUppLSGw9	\N	2017-01-27 14:34:06.054	2017-01-27 14:34:06.054	309	256	\N
638	N2OslnLHsJj	\N	2017-01-27 14:34:06.054	2017-01-27 14:34:06.054	309	250	\N
639	TyNkVCA2pmU	\N	2017-01-27 14:34:06.054	2017-01-27 14:34:06.054	309	252	\N
640	HnruuaUwUVb	\N	2017-01-27 14:34:06.054	2017-01-27 14:34:06.054	309	248	\N
584	VHPZmR9TF7M	\N	2017-01-27 14:32:26.304	2017-01-27 14:32:26.304	469	383	\N
585	SmBShL9WUtu	\N	2017-01-27 14:32:26.304	2017-01-27 14:32:26.304	469	195	\N
586	m3T9ouOGBLT	\N	2017-01-27 14:32:26.304	2017-01-27 14:32:26.304	469	381	\N
587	iqHQ4iR1gWn	\N	2017-01-27 14:32:26.304	2017-01-27 14:32:26.304	469	234	\N
641	HtJFKk82e0A	\N	2017-01-27 14:34:06.054	2017-01-27 14:34:06.054	309	258	\N
642	p3mSx3PAgtK	\N	2017-01-27 14:34:06.054	2017-01-27 14:34:06.054	309	249	\N
643	JkxNsL2qvcQ	\N	2017-01-27 14:34:06.054	2017-01-27 14:34:06.054	309	251	\N
668	c4MBqIap63k	\N	2017-01-27 14:34:56.569	2017-01-27 14:34:56.569	359	244	\N
669	FJk5VgCpLUn	\N	2017-01-27 14:34:56.569	2017-01-27 14:34:56.569	359	243	\N
670	d067md2mEnL	\N	2017-01-27 14:34:56.569	2017-01-27 14:34:56.569	359	242	\N
595	sW3yY4mvwQh	\N	2017-01-27 14:32:40.599	2017-01-27 14:32:40.599	466	196	\N
596	lCtiB3Ssvpp	\N	2017-01-27 14:32:40.599	2017-01-27 14:32:40.599	466	197	\N
657	ICXq55JQMUI	\N	2017-01-27 14:34:43.575	2017-01-27 14:34:43.575	479	201	\N
658	MAob6e0eca0	\N	2017-01-27 14:34:43.575	2017-01-27 14:34:43.575	479	220	\N
659	owE1Yrzo1Y8	\N	2017-01-27 14:34:43.575	2017-01-27 14:34:43.575	479	377	\N
660	IavL448glW3	\N	2017-01-27 14:34:43.575	2017-01-27 14:34:43.575	479	205	\N
671	gZox5iW9gtz	\N	2017-01-27 14:34:56.569	2017-01-27 14:34:56.569	359	246	\N
661	E7caag0wJKt	\N	2017-01-27 14:34:43.575	2017-01-27 14:34:43.575	479	207	\N
662	x4ucwnOGyp7	\N	2017-01-27 14:34:43.575	2017-01-27 14:34:43.575	479	382	\N
663	mVGQw9I1hDR	\N	2017-01-27 14:34:43.575	2017-01-27 14:34:43.575	479	380	\N
664	wUv4HWJiERW	\N	2017-01-27 14:34:43.575	2017-01-27 14:34:43.575	479	206	\N
665	jFjqF9cqGba	\N	2017-01-27 14:34:43.575	2017-01-27 14:34:43.575	479	198	\N
666	POYp1TBMS96	\N	2017-01-27 14:34:43.575	2017-01-27 14:34:43.575	479	199	\N
667	sVC4VnyU1QF	\N	2017-01-27 14:34:43.575	2017-01-27 14:34:43.575	479	200	\N
672	qqkQ3I8ofot	\N	2017-01-27 14:34:56.569	2017-01-27 14:34:56.569	359	247	\N
673	pTx07aSe01n	\N	2017-01-27 14:34:56.569	2017-01-27 14:34:56.569	359	245	\N
958	fXGdRE6Jssy	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	185	\N
959	nrmdoBELSLP	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	176	\N
604	BxtfXzJUzfi	\N	2017-01-27 14:33:23.729	2017-01-27 14:33:23.729	416	397	\N
960	Q6EGVkNITmL	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	170	\N
961	PB48DgZBnwS	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	177	\N
962	LIMGrX9rISe	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	175	\N
963	Xpcl6P2uF7P	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	178	\N
964	U8mQt79pTK6	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	183	\N
965	yrjBaxholHV	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	173	\N
605	FBiXeStPhOR	\N	2017-01-27 14:33:23.729	2017-01-27 14:33:23.729	416	392	\N
606	R7EOnt5hp9e	\N	2017-01-27 14:33:23.729	2017-01-27 14:33:23.729	416	389	\N
607	XxrilJoWtiy	\N	2017-01-27 14:33:23.729	2017-01-27 14:33:23.729	416	396	\N
608	utou1MWpXP4	\N	2017-01-27 14:33:23.729	2017-01-27 14:33:23.729	416	391	\N
609	IfX6zBQn1bH	\N	2017-01-27 14:33:23.729	2017-01-27 14:33:23.729	416	388	\N
610	M3qzqGGA9gX	\N	2017-01-27 14:33:23.729	2017-01-27 14:33:23.729	416	394	\N
611	JX1UJn9Pwp1	\N	2017-01-27 14:33:23.729	2017-01-27 14:33:23.729	416	393	\N
966	P5lSjxUlNsS	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	174	\N
967	tWNK1FdyJOK	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	186	\N
968	bSjfg8STqQs	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	172	\N
620	eNsEfi7FHHk	\N	2017-01-27 14:33:53.123	2017-01-27 14:33:53.123	333	278	\N
621	W6SetylqOmR	\N	2017-01-27 14:33:53.123	2017-01-27 14:33:53.123	333	280	\N
622	BW2y4pO5HEf	\N	2017-01-27 14:33:53.123	2017-01-27 14:33:53.123	333	277	\N
623	ebcOVofCo5o	\N	2017-01-27 14:33:53.123	2017-01-27 14:33:53.123	333	275	\N
624	Z9hl9TU4BOt	\N	2017-01-27 14:33:53.123	2017-01-27 14:33:53.123	333	272	\N
625	EMcH0Hek5Yq	\N	2017-01-27 14:33:53.123	2017-01-27 14:33:53.123	333	274	\N
626	VAbiQVnIM2s	\N	2017-01-27 14:33:53.123	2017-01-27 14:33:53.123	333	519	\N
627	MScnY2d2xHY	\N	2017-01-27 14:33:53.123	2017-01-27 14:33:53.123	333	276	\N
628	WCvLKfsqmZ6	\N	2017-01-27 14:33:53.123	2017-01-27 14:33:53.123	333	270	\N
629	anzQjplG1D9	\N	2017-01-27 14:33:53.123	2017-01-27 14:33:53.123	333	273	\N
630	cgd6fvnzqBg	\N	2017-01-27 14:33:53.123	2017-01-27 14:33:53.123	333	518	\N
631	GjJWPCIJbNh	\N	2017-01-27 14:33:53.123	2017-01-27 14:33:53.123	333	271	\N
681	WdqljE938Zg	\N	2017-01-27 14:35:39.613	2017-01-27 14:35:39.613	425	217	\N
682	Z60QcXg07jA	\N	2017-01-27 14:35:39.613	2017-01-27 14:35:39.613	425	219	\N
683	QkuotH6pTqZ	\N	2017-01-27 14:35:39.613	2017-01-27 14:35:39.613	425	220	\N
684	Sk0GBb2hzqM	\N	2017-01-27 14:35:39.613	2017-01-27 14:35:39.613	425	216	\N
685	WOcoR0qexqt	\N	2017-01-27 14:35:39.613	2017-01-27 14:35:39.613	425	222	\N
686	GJfNbAaWygI	\N	2017-01-27 14:35:39.613	2017-01-27 14:35:39.613	425	221	\N
687	nKF7wa3MT5J	\N	2017-01-27 14:35:39.613	2017-01-27 14:35:39.613	425	218	\N
688	LfgryNrr0L8	\N	2017-01-27 14:35:53.294	2017-01-27 14:35:53.294	433	209	\N
689	yODelMCwkrd	\N	2017-01-27 14:35:53.294	2017-01-27 14:35:53.294	433	212	\N
690	JT39jshquvM	\N	2017-01-27 14:35:53.294	2017-01-27 14:35:53.294	433	213	\N
691	USCOmEbXvgm	\N	2017-01-27 14:35:53.294	2017-01-27 14:35:53.294	433	214	\N
692	JenpTkPUa3l	\N	2017-01-27 14:35:53.294	2017-01-27 14:35:53.294	433	211	\N
693	xnh4fmGmZeI	\N	2017-01-27 14:35:53.294	2017-01-27 14:35:53.294	433	210	\N
694	xZJ2iyaxYrM	\N	2017-01-27 14:35:53.294	2017-01-27 14:35:53.294	433	215	\N
701	BZrd9bsiXwh	\N	2017-01-27 14:36:16.538	2017-01-27 14:36:16.538	352	241	\N
702	xAzy41t8TzW	\N	2017-01-27 14:36:16.538	2017-01-27 14:36:16.538	352	236	\N
703	dvg4IzBBQRM	\N	2017-01-27 14:36:16.538	2017-01-27 14:36:16.538	352	240	\N
704	ZMAUzrIVR7J	\N	2017-01-27 14:36:16.538	2017-01-27 14:36:16.538	352	238	\N
705	UXeqzAhLcNv	\N	2017-01-27 14:36:16.538	2017-01-27 14:36:16.538	352	239	\N
706	HyO2U8mbeW5	\N	2017-01-27 14:36:16.538	2017-01-27 14:36:16.538	352	237	\N
969	lIwnFFuUsmo	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	184	\N
970	EodzSZO1c0M	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	182	\N
971	drCLRsUdG4E	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	395	\N
972	d9BzCVNxeqh	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	171	\N
973	P427mjwjiTH	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	181	\N
974	qPpsw9vIQkv	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	187	\N
975	DkVCJ9CXZ6K	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	168	\N
976	RwNl41YR3JM	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	179	\N
977	zrvcvKIm18n	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	180	\N
978	WIbXA27KUuJ	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	169	\N
979	EXDky9IYIgs	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	398	\N
980	BlCD0MdVYpA	\N	2017-01-27 18:23:58.031	2017-01-27 18:23:58.031	957	390	\N
1094	FskKrNhfetQ	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	158	\N
1095	FiPyi0Jwq6u	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	989	\N
674	OECFeynBKUz	\N	2017-01-27 14:35:07.722	2017-01-27 14:35:07.722	450	227	\N
675	O5BIPE3aY4d	\N	2017-01-27 14:35:07.722	2017-01-27 14:35:07.722	450	226	\N
676	NIGkEJCnp69	\N	2017-01-27 14:35:07.722	2017-01-27 14:35:07.722	450	229	\N
677	ljf2Bkgv1V2	\N	2017-01-27 14:35:07.722	2017-01-27 14:35:07.722	450	224	\N
678	ZUy0cXCK2NQ	\N	2017-01-27 14:35:07.722	2017-01-27 14:35:07.722	450	225	\N
588	wl1XNIcDLqt	\N	2017-01-27 14:32:32.709	2017-01-27 14:32:32.709	281	205	\N
589	DmiDVFmTcgF	\N	2017-01-27 14:32:32.709	2017-01-27 14:32:32.709	281	207	\N
590	WDO0d7QAWdm	\N	2017-01-27 14:32:32.709	2017-01-27 14:32:32.709	281	208	\N
591	qF5d4FYI0Rk	\N	2017-01-27 14:32:32.709	2017-01-27 14:32:32.709	281	202	\N
592	l5Gi5cuXVYA	\N	2017-01-27 14:32:32.709	2017-01-27 14:32:32.709	281	204	\N
593	euhRNGxgEBQ	\N	2017-01-27 14:32:32.709	2017-01-27 14:32:32.709	281	203	\N
594	RYEmCPTsc2a	\N	2017-01-27 14:32:32.709	2017-01-27 14:32:32.709	281	206	\N
679	eHX5QSXqVhB	\N	2017-01-27 14:35:07.722	2017-01-27 14:35:07.722	450	223	\N
680	kXGOl70v0Hl	\N	2017-01-27 14:35:07.722	2017-01-27 14:35:07.722	450	228	\N
695	DP7kgag2dQv	\N	2017-01-27 14:36:04.793	2017-01-27 14:36:04.793	345	235	\N
696	g1nagUxN27o	\N	2017-01-27 14:36:04.793	2017-01-27 14:36:04.793	345	233	\N
697	zNMUO8mi8vc	\N	2017-01-27 14:36:04.793	2017-01-27 14:36:04.793	345	230	\N
698	ALL9Jh9FnSA	\N	2017-01-27 14:36:04.793	2017-01-27 14:36:04.793	345	234	\N
699	imBQpEz8Ywy	\N	2017-01-27 14:36:04.793	2017-01-27 14:36:04.793	345	232	\N
700	NC562ig2O6Y	\N	2017-01-27 14:36:04.793	2017-01-27 14:36:04.793	345	231	\N
1096	cWmAcRwesC0	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	387	\N
1097	gKfCcQtpo8j	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	60	\N
1098	bOrMbXQVHZj	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	88	\N
1099	VUvidQZXGlb	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	63	\N
1100	bwUnHoNYA8E	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	993	\N
1101	Jdb29WggR7Y	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	987	\N
1102	qZEKRrYd7Ht	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	106	\N
655	BJQb4fHBuAH	\N	2017-01-27 14:34:14.313	2017-01-27 14:34:14.313	321	267	\N
656	lkXIGM3HFv5	\N	2017-01-27 14:34:14.313	2017-01-27 14:34:14.313	321	562	\N
1103	EeQ54KuzwVk	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	81	\N
1104	vuAT2A2LohW	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	131	\N
1105	gxWd4m7FY5K	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	135	\N
1106	jjoFJvlGA2X	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	85	\N
1107	m1SoAb0Gb2v	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	97	\N
1108	QnDSePvWkQ5	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	115	\N
1109	GGUPzgQ5gDP	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	160	\N
1110	B2gWpsHf13B	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	92	\N
1111	RDQclzXCVMk	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	59	\N
1112	nK4rlVGeGq3	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	53	\N
644	Vz4Vn49rTG8	\N	2017-01-27 14:34:14.312	2017-01-27 14:34:14.312	321	265	\N
645	SAM3avl1u7e	\N	2017-01-27 14:34:14.312	2017-01-27 14:34:14.312	321	266	\N
1113	KC8gBMfoPFf	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	139	\N
1114	wmWDTBdR1qK	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	69	\N
1115	MBwj4pyEnmH	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	93	\N
1116	IqPnFUlgnAF	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	109	\N
1117	Lg5EdnZTfyH	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	121	\N
1118	kfYC7q3VMsk	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	991	\N
1119	qjbneqsv0Yx	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	68	\N
1120	pKOZAULyGVP	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	64	\N
1121	aB9F4cWP4k2	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	127	\N
1122	SCwwLmCVjbv	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	143	\N
1123	OMgCGLaCm5P	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	379	\N
1124	KRSrfHXgKh0	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	95	\N
1125	c7dQVGyQAbc	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	985	\N
1126	dvvvRhPFMUK	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	384	\N
1127	cRwtYw64T74	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	994	\N
1128	rVlUcsa0tZa	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	72	\N
1129	RTy5C37GxDf	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	130	\N
1130	zlxkukgCvJu	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	91	\N
1131	wniBQUXWZo9	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	147	\N
1132	w5LRwxd4f1G	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	98	\N
1133	jbEDlTb10HJ	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	134	\N
1134	As7i9HkfWHN	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	76	\N
1135	c5Tza7E4aq8	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	96	\N
597	M7ywGZFXZUn	\N	2017-01-27 14:33:11.964	2017-01-27 14:33:11.964	301	192	\N
598	OxU0ppHmuQL	\N	2017-01-27 14:33:11.964	2017-01-27 14:33:11.964	301	188	\N
599	d9KcixjO3Yp	\N	2017-01-27 14:33:11.964	2017-01-27 14:33:11.964	301	191	\N
600	oxFEKLlF8D2	\N	2017-01-27 14:33:11.964	2017-01-27 14:33:11.964	301	194	\N
601	eOguTjm3Ybk	\N	2017-01-27 14:33:11.964	2017-01-27 14:33:11.964	301	189	\N
602	YlL8rEW8XF3	\N	2017-01-27 14:33:11.964	2017-01-27 14:33:11.964	301	190	\N
603	GFPBGQnxHk8	\N	2017-01-27 14:33:11.964	2017-01-27 14:33:11.964	301	193	\N
612	xlx3ERVXRpU	\N	2017-01-27 14:33:37.037	2017-01-27 14:33:37.037	407	374	\N
613	uzEIOBTQJf6	\N	2017-01-27 14:33:37.037	2017-01-27 14:33:37.037	407	372	\N
614	iq6v8shHghS	\N	2017-01-27 14:33:37.037	2017-01-27 14:33:37.037	407	369	\N
615	dSunLU6q0CU	\N	2017-01-27 14:33:37.037	2017-01-27 14:33:37.037	407	367	\N
616	ijFf2Hf6IP2	\N	2017-01-27 14:33:37.037	2017-01-27 14:33:37.037	407	371	\N
617	IeXeJYz4r9e	\N	2017-01-27 14:33:37.037	2017-01-27 14:33:37.037	407	375	\N
618	z5w5uopVhXO	\N	2017-01-27 14:33:37.037	2017-01-27 14:33:37.037	407	366	\N
619	z8ygQStQfgA	\N	2017-01-27 14:33:37.037	2017-01-27 14:33:37.037	407	370	\N
646	XMZiBBBZy6y	\N	2017-01-27 14:34:14.312	2017-01-27 14:34:14.312	321	260	\N
647	HqKPs56cDhl	\N	2017-01-27 14:34:14.312	2017-01-27 14:34:14.312	321	263	\N
648	AlER5e2qZCM	\N	2017-01-27 14:34:14.312	2017-01-27 14:34:14.312	321	561	\N
649	PINtzOitx2O	\N	2017-01-27 14:34:14.312	2017-01-27 14:34:14.312	321	269	\N
650	FCmcM19xh33	\N	2017-01-27 14:34:14.312	2017-01-27 14:34:14.312	321	259	\N
651	NvtsYoOi0ke	\N	2017-01-27 14:34:14.312	2017-01-27 14:34:14.312	321	268	\N
652	cwvSrDLc2xx	\N	2017-01-27 14:34:14.312	2017-01-27 14:34:14.312	321	261	\N
653	MBT536pq46t	\N	2017-01-27 14:34:14.312	2017-01-27 14:34:14.312	321	262	\N
654	hISXgUfBzGn	\N	2017-01-27 14:34:14.313	2017-01-27 14:34:14.313	321	264	\N
998	wHF35ONoG7x	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	50	\N
999	xVbOpcwitbH	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	70	\N
1000	GtlMVSoviKl	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	54	\N
1001	sfdYvAljaXN	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	89	\N
1002	vOK5mXtKla0	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	128	\N
1003	ZJ9Vo2xZtkf	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	126	\N
1004	EEU0M5wa6GY	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	51	\N
1005	zo2QcV4eoLh	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	105	\N
1006	VGc5GWb2Jtt	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	992	\N
1007	JxRzZ86bx5T	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	87	\N
1008	O7FgDxccGvn	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	79	\N
1009	DfdzvVk95Et	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	997	\N
1010	EWdYdlG3VJ6	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	996	\N
1011	xPX2bxTK3cT	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	80	\N
1012	myBwrFVnC15	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	149	\N
1013	gf3n4Z86HfC	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	995	\N
1014	Uvr7CUId1WP	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	52	\N
1015	QWfvjlV7tZU	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	61	\N
1016	R2SKhzGMf5W	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	129	\N
1017	H0NZQBfCT2Y	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	124	\N
1018	LX1sH5J7zGR	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	119	\N
1019	m0XYVgNFwvy	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	71	\N
1020	Ps2PHrjoWdS	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	155	\N
1021	bWf2hIHfheJ	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	150	\N
1022	q3c2Ybx3FuK	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	56	\N
1023	VcFmB3eYcmQ	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	145	\N
1024	rodEKTsb4bO	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	110	\N
1025	XNpoBszddjQ	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	166	\N
1026	SbckQlbVaNm	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	144	\N
1027	PnDeL1FIGCy	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	75	\N
1028	T310kiTsOKO	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	57	\N
1029	hHWfvkcwmPW	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	67	\N
1030	Wp5RGk6c9gV	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	55	\N
1031	Ae6elSqG4XD	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	138	\N
1032	t9sgoArUD4p	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	137	\N
1033	Dklb8mvSXOT	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	74	\N
1034	rNT90iRLYYi	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	140	\N
1035	xeTzp36NOzA	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	984	\N
1036	L4bpnUG2IJ3	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	107	\N
1037	WwzpTH4vUbN	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	157	\N
1038	Dh71d0WyXnb	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	113	\N
1039	hlMqa9hqb6Z	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	83	\N
1040	wiH816tuVcq	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	132	\N
1041	Xm7OTvhlXOW	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	163	\N
1042	YjsCRXUlU5I	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	125	\N
1043	aZnkxxP9ADm	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	141	\N
1044	jrC1BNFp6F3	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	84	\N
1045	yooJQEnWW40	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	112	\N
1046	whxVCn1kVv3	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	156	\N
1047	hKghsPdJlss	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	990	\N
1048	TgObvzvN0ct	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	90	\N
1049	BbSPIcMoQjV	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	133	\N
1050	XQzPUD6p0UX	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	122	\N
1051	PMdsGDXWusT	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	161	\N
1052	cCdeaU57vJ6	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	136	\N
1053	AI3dljPxT2x	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	103	\N
1054	EA2Ypxve77t	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	94	\N
1055	hUFG6obEYAr	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	73	\N
1056	qynSOqY3kGN	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	58	\N
1057	rkC2p0gCBgl	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	986	\N
1058	ZBvZ3J27Pox	\N	2017-01-27 19:12:52.803	2017-01-27 19:12:52.803	712	117	\N
1059	QHZvgrAUfYr	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	148	\N
1060	NXS31InXqx2	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	78	\N
1061	M9Em4t9qi57	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	118	\N
1062	OF408FCPVbY	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	66	\N
1063	Em482kBS4ab	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	111	\N
1064	tn6CCLqt9HD	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	108	\N
1065	YZw83P91sxN	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	116	\N
1066	k4wizyrdgpN	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	988	\N
1067	KBEfgmRTIHZ	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	142	\N
1068	s5f9vGGE8E2	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	152	\N
1069	sE07FCaLQqf	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	48	\N
1070	ysgyj3UCSwr	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	159	\N
1071	SFfe8KFELJV	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	62	\N
1072	iZvExdyHHGj	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	167	\N
1073	xEYZZwYixAc	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	65	\N
1074	TMK4pqjnyLK	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	165	\N
1075	l1VGwgoUJ4s	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	151	\N
1076	IPhxzUrQnzz	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	154	\N
1077	NbVC2Is8qg5	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	102	\N
1078	QxrNbiSWRgb	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	104	\N
1079	PQR2yRqh77p	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	49	\N
1080	vgOUd2LevHa	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	77	\N
1081	fVMK6PDZqrQ	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	123	\N
1082	Vu0IKILN70h	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	101	\N
1083	FivyjzSi5tr	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	153	\N
1084	s88BhbKjudU	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	162	\N
1085	vMNMT4nnnWc	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	120	\N
1086	i9zHsUZnQ27	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	100	\N
1087	VBqOi6BPSM2	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	86	\N
1088	ucufxgJiCmR	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	164	\N
1089	FAFwq61Evx2	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	99	\N
1090	BLuPl9ZswHo	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	146	\N
1091	W7pxJE2v85e	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	114	\N
1092	mFAC2dUfMgR	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	983	\N
1093	VaqadZUiM1j	\N	2017-01-27 19:12:52.804	2017-01-27 19:12:52.804	712	82	\N
\.


--
-- Data for Name: datasetindicators; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY datasetindicators (datasetid, indicatorid) FROM stdin;
\.


--
-- Data for Name: datasetoperands; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY datasetoperands (datasetid, dataelementoperandid) FROM stdin;
\.


--
-- Data for Name: datasetsectiontranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY datasetsectiontranslations (sectionid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: datasetsource; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY datasetsource (datasetid, sourceid) FROM stdin;
469	458
281	458
466	458
301	458
416	458
407	458
333	458
309	458
321	458
479	458
359	458
450	458
425	458
433	458
345	458
352	458
712	458
957	458
\.


--
-- Data for Name: datasettranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY datasettranslations (datasetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: datasetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY datasetusergroupaccesses (datasetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: datastatistics; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY datastatistics (statisticsid, uid, code, created, lastupdated, chartviews, mapviews, reporttableviews, eventreportviews, eventchartviews, dashboardviews, datasetreportviews, active_users, totalviews, charts, maps, reporttables, eventreports, eventcharts, dashboards, indicators, datavalues, users) FROM stdin;
\.


--
-- Data for Name: datastatisticsevent; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY datastatisticsevent (eventid, eventtype, "timestamp", username, favoriteuid) FROM stdin;
1141	DATA_SET_REPORT_VIEW	2017-01-27 19:29:05.405	admin	hSZ19zapkx8
1142	DATA_SET_REPORT_VIEW	2017-01-27 19:29:30.173	admin	nuNWPPZi58G
\.


--
-- Data for Name: datavalue; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY datavalue (dataelementid, periodid, sourceid, categoryoptioncomboid, attributeoptioncomboid, value, storedby, created, lastupdated, comment, followup, deleted) FROM stdin;
519	1136	458	15	15	\N	admin	2017-01-27 19:25:11.593	2017-01-27 19:25:19.424	\N	f	t
\.


--
-- Data for Name: datavalueaudit; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY datavalueaudit (datavalueauditid, dataelementid, periodid, organisationunitid, categoryoptioncomboid, attributeoptioncomboid, value, created, modifiedby, audittype) FROM stdin;
1137	519	1136	458	15	15	55fdsgfdg	2017-01-27 19:25:19.428	admin	DELETE
\.


--
-- Data for Name: document; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY document (documentid, uid, code, created, lastupdated, name, url, external, contenttype, attachment, externalaccess, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: documentattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY documentattributevalues (documentid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: documenttranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY documenttranslations (documentid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: documentusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY documentusergroupaccesses (documentid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: donorunitusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY donorunitusergroupaccesses (donorunitid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: eventchart; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventchart (eventchartid, uid, code, created, lastupdated, name, description, relativeperiodsid, userorganisationunit, userorganisationunitchildren, userorganisationunitgrandchildren, programid, programstageid, startdate, enddate, dataelementvaluedimensionid, attributevaluedimensionid, aggregationtype, completedonly, title, type, showdata, hideemptyrows, hidenadata, rangeaxismaxvalue, rangeaxisminvalue, rangeaxissteps, rangeaxisdecimals, outputtype, collapsedatadimensions, domainaxislabel, rangeaxislabel, hidelegend, hidetitle, hidesubtitle, regressiontype, targetlinevalue, targetlinelabel, baselinevalue, baselinelabel, sortorder, externalaccess, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: eventchart_attributedimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventchart_attributedimensions (eventchartid, sort_order, trackedentityattributedimensionid) FROM stdin;
\.


--
-- Data for Name: eventchart_columns; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventchart_columns (eventchartid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: eventchart_dataelementdimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventchart_dataelementdimensions (eventchartid, sort_order, trackedentitydataelementdimensionid) FROM stdin;
\.


--
-- Data for Name: eventchart_filters; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventchart_filters (eventchartid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: eventchart_itemorgunitgroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventchart_itemorgunitgroups (eventchartid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: eventchart_organisationunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventchart_organisationunits (eventchartid, sort_order, organisationunitid) FROM stdin;
\.


--
-- Data for Name: eventchart_orgunitgroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventchart_orgunitgroups (eventchartid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: eventchart_orgunitlevels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventchart_orgunitlevels (eventchartid, sort_order, orgunitlevel) FROM stdin;
\.


--
-- Data for Name: eventchart_periods; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventchart_periods (eventchartid, sort_order, periodid) FROM stdin;
\.


--
-- Data for Name: eventchart_programindicatordimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventchart_programindicatordimensions (eventchartid, sort_order, trackedentityprogramindicatordimensionid) FROM stdin;
\.


--
-- Data for Name: eventchart_rows; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventchart_rows (eventchartid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: eventcharttranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventcharttranslations (eventchartid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: eventchartusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventchartusergroupaccesses (eventchartid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: eventreport; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventreport (eventreportid, uid, code, created, lastupdated, name, description, relativeperiodsid, userorganisationunit, userorganisationunitchildren, userorganisationunitgrandchildren, programid, programstageid, startdate, enddate, dataelementvaluedimensionid, attributevaluedimensionid, aggregationtype, completedonly, title, datatype, rowtotals, coltotals, rowsubtotals, colsubtotals, hideemptyrows, hidenadata, showhierarchy, outputtype, collapsedatadimensions, showdimensionlabels, digitgroupseparator, displaydensity, fontsize, sortorder, toplimit, externalaccess, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: eventreport_attributedimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventreport_attributedimensions (eventreportid, sort_order, trackedentityattributedimensionid) FROM stdin;
\.


--
-- Data for Name: eventreport_columns; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventreport_columns (eventreportid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: eventreport_dataelementdimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventreport_dataelementdimensions (eventreportid, sort_order, trackedentitydataelementdimensionid) FROM stdin;
\.


--
-- Data for Name: eventreport_filters; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventreport_filters (eventreportid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: eventreport_itemorgunitgroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventreport_itemorgunitgroups (eventreportid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: eventreport_organisationunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventreport_organisationunits (eventreportid, sort_order, organisationunitid) FROM stdin;
\.


--
-- Data for Name: eventreport_orgunitgroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventreport_orgunitgroups (eventreportid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: eventreport_orgunitlevels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventreport_orgunitlevels (eventreportid, sort_order, orgunitlevel) FROM stdin;
\.


--
-- Data for Name: eventreport_periods; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventreport_periods (eventreportid, sort_order, periodid) FROM stdin;
\.


--
-- Data for Name: eventreport_programindicatordimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventreport_programindicatordimensions (eventreportid, sort_order, trackedentityprogramindicatordimensionid) FROM stdin;
\.


--
-- Data for Name: eventreport_rows; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventreport_rows (eventreportid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: eventreporttranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventreporttranslations (eventreportid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: eventreportusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY eventreportusergroupaccesses (eventreportid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: expression; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY expression (expressionid, description, expression, missingvaluestrategy) FROM stdin;
\.


--
-- Data for Name: expressiondataelement; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY expressiondataelement (expressionid, dataelementid) FROM stdin;
\.


--
-- Data for Name: expressionsampleelement; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY expressionsampleelement (expressionid, dataelementid) FROM stdin;
\.


--
-- Data for Name: externalfileresource; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY externalfileresource (externalfileresourceid, uid, code, created, lastupdated, accesstoken, expires, fileresourceid) FROM stdin;
\.


--
-- Data for Name: externalmaplayer; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY externalmaplayer (externalmaplayerid, uid, code, created, lastupdated, name, attribution, url, legendseturl, maplayerposition, layers, imageformat, mapservice, legendsetid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: externalmaplayerusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY externalmaplayerusergroupaccesses (externalmaplayerid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: fileresource; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY fileresource (fileresourceid, uid, code, created, lastupdated, name, contenttype, contentlength, contentmd5, storagekey, isassigned, storagestatus, domain, userid) FROM stdin;
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: dhis
--

SELECT pg_catalog.setval('hibernate_sequence', 1142, true);


--
-- Data for Name: i18nlocale; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY i18nlocale (i18nlocaleid, uid, code, created, lastupdated, name, locale) FROM stdin;
18	GEuHeLoysUr	\N	2017-01-27 08:36:36.842	2017-01-27 08:36:36.842	Afrikaans	af
19	YDMnajVQ1ej	\N	2017-01-27 08:36:36.844	2017-01-27 08:36:36.844	Arabic	ar
20	YfaLkzRDeSe	\N	2017-01-27 08:36:36.846	2017-01-27 08:36:36.846	Bislama	bi
21	gEvwA9ArV3N	\N	2017-01-27 08:36:36.847	2017-01-27 08:36:36.847	Amharic	am
22	OR5tX3hZCv7	\N	2017-01-27 08:36:36.848	2017-01-27 08:36:36.848	German	de
23	yAlpj8u6D8N	\N	2017-01-27 08:36:36.849	2017-01-27 08:36:36.849	Dzongkha	dz
24	f8DaSGKq1nv	\N	2017-01-27 08:36:36.85	2017-01-27 08:36:36.85	English	en
25	WkDyvrkV4GB	\N	2017-01-27 08:36:36.851	2017-01-27 08:36:36.852	Spanish	es
26	oAGCNJpWwxb	\N	2017-01-27 08:36:36.853	2017-01-27 08:36:36.853	Persian	fa
27	fS0DTC3v05m	\N	2017-01-27 08:36:36.854	2017-01-27 08:36:36.854	French	fr
28	Vt2aMKkUaZK	\N	2017-01-27 08:36:36.855	2017-01-27 08:36:36.855	Gujarati	gu
29	dP6Ur1tPRdZ	\N	2017-01-27 08:36:36.856	2017-01-27 08:36:36.856	Hindi	hi
30	g5kDp0J9XBk	\N	2017-01-27 08:36:36.858	2017-01-27 08:36:36.858	Indonesian	in
31	pQ7oS3dzYe9	\N	2017-01-27 08:36:36.859	2017-01-27 08:36:36.859	Italian	it
32	KzflGlQskhZ	\N	2017-01-27 08:36:36.86	2017-01-27 08:36:36.86	Khmer	km
33	ZuNDuTB5rGc	\N	2017-01-27 08:36:36.861	2017-01-27 08:36:36.861	Lao	lo
34	VbyOSMxbCDN	\N	2017-01-27 08:36:36.863	2017-01-27 08:36:36.863	Burmese	my
35	QLYaWsj07Y6	\N	2017-01-27 08:36:36.864	2017-01-27 08:36:36.864	Nepali	ne
36	QWRCwSFJQao	\N	2017-01-27 08:36:36.865	2017-01-27 08:36:36.865	Dutch	nl
37	R28bcLdLZKF	\N	2017-01-27 08:36:36.867	2017-01-27 08:36:36.867	Norwegian	no
38	LJfJ378D1O2	\N	2017-01-27 08:36:36.868	2017-01-27 08:36:36.868	Pushto	ps
39	wIrPiu6RRCq	\N	2017-01-27 08:36:36.869	2017-01-27 08:36:36.869	Portuguese	pt
40	rDpAabKw0Ro	\N	2017-01-27 08:36:36.87	2017-01-27 08:36:36.87	Russian	ru
41	plvxazx7i0x	\N	2017-01-27 08:36:36.871	2017-01-27 08:36:36.871	Kinyarwanda	rw
42	mwkE3dSHvP6	\N	2017-01-27 08:36:36.872	2017-01-27 08:36:36.872	Swahili	sw
43	QaeqLUGtKCg	\N	2017-01-27 08:36:36.873	2017-01-27 08:36:36.873	Tajik	tg
44	o6LXwQWXLgI	\N	2017-01-27 08:36:36.873	2017-01-27 08:36:36.874	Vietnamese	vi
45	JuFatfkNySp	\N	2017-01-27 08:36:36.874	2017-01-27 08:36:36.874	Chinese	zh
\.


--
-- Data for Name: incomingsms; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY incomingsms (id, originator, encoding, sentdate, receiveddate, text, gatewayid, status, parsed, statusmessage) FROM stdin;
\.


--
-- Data for Name: indicator; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY indicator (indicatorid, uid, code, created, lastupdated, name, shortname, description, annualized, decimals, indicatortypeid, numerator, numeratordescription, denominator, denominatordescription, url, legendsetid, aggregateexportcategoryoptioncombo, aggregateexportattributeoptioncombo, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: indicatorattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY indicatorattributevalues (indicatorid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: indicatorgroup; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY indicatorgroup (indicatorgroupid, uid, code, created, lastupdated, name, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: indicatorgroupattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY indicatorgroupattributevalues (indicatorgroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: indicatorgroupmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY indicatorgroupmembers (indicatorgroupid, indicatorid) FROM stdin;
\.


--
-- Data for Name: indicatorgroupset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY indicatorgroupset (indicatorgroupsetid, uid, code, created, lastupdated, name, description, compulsory, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: indicatorgroupsetmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY indicatorgroupsetmembers (indicatorgroupid, indicatorgroupsetid, sort_order) FROM stdin;
\.


--
-- Data for Name: indicatorgroupsettranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY indicatorgroupsettranslations (indicatorgroupsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: indicatorgroupsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY indicatorgroupsetusergroupaccesses (indicatorgroupsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: indicatorgrouptranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY indicatorgrouptranslations (indicatorgroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: indicatorgroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY indicatorgroupusergroupaccesses (indicatorgroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: indicatortranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY indicatortranslations (indicatorid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: indicatortype; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY indicatortype (indicatortypeid, uid, code, created, lastupdated, name, indicatorfactor, indicatornumber) FROM stdin;
\.


--
-- Data for Name: indicatortypetranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY indicatortypetranslations (indicatortypeid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: indicatorusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY indicatorusergroupaccesses (indicatorid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: intepretation_likedby; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY intepretation_likedby (interpretationid, userid) FROM stdin;
\.


--
-- Data for Name: interpretation; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY interpretation (interpretationid, uid, lastupdated, reporttableid, chartid, mapid, eventreportid, eventchartid, datasetid, periodid, organisationunitid, interpretationtext, created, likes, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: interpretation_comments; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY interpretation_comments (interpretationid, sort_order, interpretationcommentid) FROM stdin;
\.


--
-- Data for Name: interpretationcomment; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY interpretationcomment (interpretationcommentid, uid, lastupdated, commenttext, userid, created) FROM stdin;
\.


--
-- Data for Name: interpretationusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY interpretationusergroupaccesses (interpretationid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: jphes_agencyunit; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY jphes_agencyunit (agencyunitid, uid, code, created, lastupdated, name, shortname, enabled, description, donorunitid, usergroupid, categoryoptiongroupid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: jphes_agencyunitmechanismunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY jphes_agencyunitmechanismunits (agencyunitid, mechanismunitid) FROM stdin;
\.


--
-- Data for Name: jphes_agencyunitprograms; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY jphes_agencyunitprograms (agencyunitid, programid) FROM stdin;
\.


--
-- Data for Name: jphes_donorunit; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY jphes_donorunit (donorunitid, uid, code, created, lastupdated, name, shortname, enabled, description, nationalunitid, usergroupid, categoryoptiongroupid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: jphes_donorunitagencyunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY jphes_donorunitagencyunits (donorunitid, agencyunitid) FROM stdin;
\.


--
-- Data for Name: jphes_donorunitprograms; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY jphes_donorunitprograms (donorunitid, programid) FROM stdin;
\.


--
-- Data for Name: jphes_mechanismunit; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY jphes_mechanismunit (mechanismunitid, uid, code, created, lastupdated, name, shortname, partner, enabled, description, agencyunitid, usergroupid, categoryoptionid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: jphes_mechanismunitprograms; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY jphes_mechanismunitprograms (mechanismunitid, programid) FROM stdin;
\.


--
-- Data for Name: jphes_nationalunit; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY jphes_nationalunit (nationalunitid, uid, code, created, lastupdated, name, shortname, enabled, description, categoryid, categorycomboid, usergroupid, categoryoptiongroupsetagencyid, categoryoptiongroupsetdonorid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: jphes_nationalunitdonorunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY jphes_nationalunitdonorunits (nationalunitid, donorunitid) FROM stdin;
\.


--
-- Data for Name: jphes_nationalunitprograms; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY jphes_nationalunitprograms (nationalunitid, programid) FROM stdin;
\.


--
-- Data for Name: jphes_program; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY jphes_program (programid, uid, code, created, lastupdated, name, shortname, enabled, description, dataelementgroupid, indicatorgroupid) FROM stdin;
\.


--
-- Data for Name: jphes_programdataelements; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY jphes_programdataelements (programid, dataelementid) FROM stdin;
\.


--
-- Data for Name: jphes_programindicators; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY jphes_programindicators (programid, indicatorid) FROM stdin;
\.


--
-- Data for Name: keyjsonvalue; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY keyjsonvalue (keyjsonvalueid, uid, code, created, lastupdated, namespace, namespacekey, value, encrypted_value, encrypted) FROM stdin;
\.


--
-- Data for Name: legendsetattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY legendsetattributevalues (legendsetid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: legendsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY legendsetusergroupaccesses (maplegendsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: lockexception; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY lockexception (lockexceptionid, organisationunitid, periodid, datasetid) FROM stdin;
\.


--
-- Data for Name: map; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY map (mapid, uid, code, created, lastupdated, name, description, longitude, latitude, zoom, basemap, title, externalaccess, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: maplegend; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY maplegend (maplegendid, uid, code, created, lastupdated, name, startvalue, endvalue, color, image) FROM stdin;
\.


--
-- Data for Name: maplegendset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY maplegendset (maplegendsetid, uid, code, created, lastupdated, name, symbolizer, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: maplegendsetmaplegend; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY maplegendsetmaplegend (legendsetid, maplegendid) FROM stdin;
\.


--
-- Data for Name: maplegendsettranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY maplegendsettranslations (maplegendsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: maplegendtranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY maplegendtranslations (maplegendid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: mapmapviews; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY mapmapviews (mapid, sort_order, mapviewid) FROM stdin;
\.


--
-- Data for Name: mapusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY mapusergroupaccesses (mapid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: mapview; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY mapview (mapviewid, uid, code, created, lastupdated, description, layer, relativeperiodsid, userorganisationunit, userorganisationunitchildren, userorganisationunitgrandchildren, aggregationtype, programid, programstageid, startdate, enddate, method, classes, colorlow, colorhigh, colorscale, legendsetid, radiuslow, radiushigh, opacity, orgunitgroupsetid, arearadius, hidden, labels, labelfontsize, labelfontweight, labelfontstyle, labelfontcolor, eventclustering, eventpointcolor, eventpointradius, config) FROM stdin;
\.


--
-- Data for Name: mapview_attributedimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY mapview_attributedimensions (mapviewid, sort_order, trackedentityattributedimensionid) FROM stdin;
\.


--
-- Data for Name: mapview_columns; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY mapview_columns (mapviewid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: mapview_datadimensionitems; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY mapview_datadimensionitems (mapviewid, sort_order, datadimensionitemid) FROM stdin;
\.


--
-- Data for Name: mapview_dataelementdimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY mapview_dataelementdimensions (mapviewid, sort_order, trackedentitydataelementdimensionid) FROM stdin;
\.


--
-- Data for Name: mapview_itemorgunitgroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY mapview_itemorgunitgroups (mapviewid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: mapview_organisationunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY mapview_organisationunits (mapviewid, sort_order, organisationunitid) FROM stdin;
\.


--
-- Data for Name: mapview_orgunitlevels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY mapview_orgunitlevels (mapviewid, sort_order, orgunitlevel) FROM stdin;
\.


--
-- Data for Name: mapview_periods; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY mapview_periods (mapviewid, sort_order, periodid) FROM stdin;
\.


--
-- Data for Name: mapviewtranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY mapviewtranslations (mapviewid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: mechanismunitusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY mechanismunitusergroupaccesses (mechanismunitid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY message (messageid, uid, created, lastupdated, messagetext, internal, metadata, userid) FROM stdin;
\.


--
-- Data for Name: messageconversation; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY messageconversation (messageconversationid, uid, messagecount, created, lastupdated, subject, priority, status, lastsenderid, lastmessage, userid) FROM stdin;
\.


--
-- Data for Name: messageconversation_messages; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY messageconversation_messages (messageconversationid, sort_order, messageid) FROM stdin;
\.


--
-- Data for Name: messageconversation_usermessages; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY messageconversation_usermessages (messageconversationid, usermessageid) FROM stdin;
\.


--
-- Data for Name: metadataversion; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY metadataversion (versionid, uid, code, created, lastupdated, name, versiontype, importdate, hashcode) FROM stdin;
\.


--
-- Data for Name: minmaxdataelement; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY minmaxdataelement (minmaxdataelementid, sourceid, dataelementid, categoryoptioncomboid, minimumvalue, maximumvalue, generatedvalue) FROM stdin;
\.


--
-- Data for Name: nationalunitusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY nationalunitusergroupaccesses (nationalunitid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: oauth2client; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY oauth2client (oauth2clientid, uid, code, created, lastupdated, name, cid, secret) FROM stdin;
\.


--
-- Data for Name: oauth2clientgranttypes; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY oauth2clientgranttypes (oauth2clientid, sort_order, granttype) FROM stdin;
\.


--
-- Data for Name: oauth2clientredirecturis; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY oauth2clientredirecturis (oauth2clientid, sort_order, redirecturi) FROM stdin;
\.


--
-- Data for Name: oauth_access_token; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY oauth_access_token (token_id, token, authentication_id, user_name, client_id, authentication, refresh_token) FROM stdin;
\.


--
-- Data for Name: oauth_code; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY oauth_code (code, authentication) FROM stdin;
\.


--
-- Data for Name: oauth_refresh_token; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY oauth_refresh_token (token_id, token, authentication) FROM stdin;
\.


--
-- Data for Name: objecttranslation; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY objecttranslation (objecttranslationid, locale, property, value) FROM stdin;
\.


--
-- Data for Name: optionattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY optionattributevalues (optionvalueid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: optiongroup; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY optiongroup (optiongroupid, uid, code, created, lastupdated, name, shortname, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: optiongroupattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY optiongroupattributevalues (optiongroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: optiongroupmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY optiongroupmembers (optiongroupid, optionid) FROM stdin;
\.


--
-- Data for Name: optiongroupset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY optiongroupset (optiongroupsetid, uid, code, created, lastupdated, name, description, datadimension, optionsetid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: optiongroupsetmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY optiongroupsetmembers (optiongroupsetid, sort_order, optiongroupid) FROM stdin;
\.


--
-- Data for Name: optiongroupsettranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY optiongroupsettranslations (optiongroupsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: optiongroupsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY optiongroupsetusergroupaccesses (optiongroupsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: optiongrouptranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY optiongrouptranslations (optiongroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: optiongroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY optiongroupusergroupaccesses (optiongroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: optionset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY optionset (optionsetid, uid, code, created, lastupdated, name, valuetype, version, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: optionsetattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY optionsetattributevalues (optionsetid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: optionsettranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY optionsettranslations (optionsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: optionsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY optionsetusergroupaccesses (optionsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY optionvalue (optionvalueid, uid, code, name, created, lastupdated, optionsetid, sort_order) FROM stdin;
\.


--
-- Data for Name: optionvaluetranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY optionvaluetranslations (optionvalueid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: organisationunit; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY organisationunit (organisationunitid, uid, code, created, lastupdated, name, shortname, parentid, path, hierarchylevel, description, openingdate, closeddate, comment, featuretype, coordinates, url, contactperson, address, email, phonenumber, userid) FROM stdin;
458	Vkc6T0eo6rl	\N	2017-01-27 12:13:41.961	2017-01-27 12:13:41.975	Dummy	Dummy	\N	/Vkc6T0eo6rl	1	\N	2017-01-27	\N	\N	NONE	\N	\N	\N	\N	\N	\N	46
\.


--
-- Data for Name: organisationunitattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY organisationunitattributevalues (organisationunitid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: organisationunittranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY organisationunittranslations (organisationunitid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: orgunitgroup; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY orgunitgroup (orgunitgroupid, uid, code, created, lastupdated, name, shortname, symbol, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: orgunitgroupattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY orgunitgroupattributevalues (orgunitgroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY orgunitgroupmembers (organisationunitid, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY orgunitgroupset (orgunitgroupsetid, uid, code, created, lastupdated, name, description, compulsory, datadimension, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: orgunitgroupsetattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY orgunitgroupsetattributevalues (orgunitgroupsetid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupsetmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY orgunitgroupsetmembers (orgunitgroupid, orgunitgroupsetid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupsettranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY orgunitgroupsettranslations (orgunitgroupsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY orgunitgroupsetusergroupaccesses (orgunitgroupsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: orgunitgrouptranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY orgunitgrouptranslations (orgunitgroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY orgunitgroupusergroupaccesses (orgunitgroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: orgunitlevel; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY orgunitlevel (orgunitlevelid, uid, code, created, lastupdated, name, level, offlinelevels) FROM stdin;
\.


--
-- Data for Name: orgunitleveltranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY orgunitleveltranslations (orgunitlevelid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: outbound_sms; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY outbound_sms (id, date, message, status, sender) FROM stdin;
\.


--
-- Data for Name: outbound_sms_recipients; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY outbound_sms_recipients (outbound_sms_id, elt) FROM stdin;
\.


--
-- Data for Name: period; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY period (periodid, periodtypeid, startdate, enddate) FROM stdin;
1136	3	2016-10-01	2016-10-31
1138	6	2016-01-01	2016-06-30
1139	6	2016-07-01	2016-12-31
1140	3	2017-09-01	2017-09-30
\.


--
-- Data for Name: periodtype; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY periodtype (periodtypeid, name) FROM stdin;
1	Daily
2	Weekly
3	Monthly
4	BiMonthly
5	Quarterly
6	SixMonthly
7	SixMonthlyApril
8	Yearly
9	FinancialApril
10	FinancialJuly
11	FinancialOct
\.


--
-- Data for Name: predictor; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY predictor (predictorid, uid, code, created, lastupdated, name, description, generatorexpressionid, generatoroutput, generatoroutputcombo, skiptestexpressionid, periodtypeid, sequentialsamplecount, annualsamplecount, sequentialskipcount) FROM stdin;
\.


--
-- Data for Name: predictororgunitlevels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY predictororgunitlevels (predictorid, orgunitlevelid) FROM stdin;
\.


--
-- Data for Name: program; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY program (programid, uid, code, created, lastupdated, name, shortname, description, version, enrollmentdatelabel, incidentdatelabel, type, displayincidentdate, onlyenrollonce, skipoffline, displayfrontpagelist, usefirststageduringregistration, capturecoordinates, expirydays, completeeventsexpirydays, expiryperiodtypeid, ignoreoverdueevents, selectenrollmentdatesinfuture, selectincidentdatesinfuture, relationshiptext, relationshiptypeid, relationshipfroma, relatedprogramid, dataentrymethod, categorycomboid, trackedentityid, dataentryformid, workflowid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: program_attributes; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY program_attributes (programtrackedentityattributeid, uid, code, created, lastupdated, programid, trackedentityattributeid, displayinlist, mandatory, allowfuturedate, sort_order) FROM stdin;
\.


--
-- Data for Name: program_criteria; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY program_criteria (programid, validationcriteriaid) FROM stdin;
\.


--
-- Data for Name: program_organisationunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY program_organisationunits (organisationunitid, programid) FROM stdin;
\.


--
-- Data for Name: program_userroles; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY program_userroles (userroleid, programid) FROM stdin;
\.


--
-- Data for Name: programattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programattributevalues (programid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: programdataelement; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programdataelement (programdataelementid, uid, code, created, lastupdated, programid, dataelementid) FROM stdin;
\.


--
-- Data for Name: programdataelementtranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programdataelementtranslations (programdataelementid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programexpression; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programexpression (programexpressionid, description, expression) FROM stdin;
\.


--
-- Data for Name: programindicator; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programindicator (programindicatorid, uid, code, created, lastupdated, name, shortname, description, programid, expression, filter, aggregationtype, decimals, legendsetid, aggregateexportcategoryoptioncombo, aggregateexportattributeoptioncombo, displayinform, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: programindicatorattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programindicatorattributevalues (programindicatorid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: programindicatorgroup; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programindicatorgroup (programindicatorgroupid, uid, code, created, lastupdated, name, description, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: programindicatorgroupattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programindicatorgroupattributevalues (programindicatorgroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: programindicatorgroupmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programindicatorgroupmembers (programindicatorgroupid, programindicatorid) FROM stdin;
\.


--
-- Data for Name: programindicatorgrouptranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programindicatorgrouptranslations (programindicatorgroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programindicatorgroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programindicatorgroupusergroupaccesses (programindicatorgroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: programindicatortranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programindicatortranslations (programindicatorid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programindicatorusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programindicatorusergroupaccesses (programindicatorid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: programinstance; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programinstance (programinstanceid, uid, created, lastupdated, incidentdate, enrollmentdate, enddate, followup, completedby, longitude, latitude, status, trackedentityinstanceid, programid, organisationunitid) FROM stdin;
\.


--
-- Data for Name: programinstance_messageconversation; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programinstance_messageconversation (programinstanceid, sort_order, messageconversationid) FROM stdin;
\.


--
-- Data for Name: programinstancecomments; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programinstancecomments (programinstanceid, sort_order, trackedentitycommentid) FROM stdin;
\.


--
-- Data for Name: programmessage; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programmessage (id, uid, code, created, lastupdated, text, subject, processeddate, messagestatus, trackedentityinstanceid, organisationunitid, programinstanceid, programstageinstanceid) FROM stdin;
\.


--
-- Data for Name: programmessage_deliverychannels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programmessage_deliverychannels (programmessagedeliverychannelsid, deliverychannel) FROM stdin;
\.


--
-- Data for Name: programmessage_emailaddresses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programmessage_emailaddresses (programmessageemailaddressid, email) FROM stdin;
\.


--
-- Data for Name: programmessage_phonenumbers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programmessage_phonenumbers (programmessagephonenumberid, phonenumber) FROM stdin;
\.


--
-- Data for Name: programmessagetranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programmessagetranslations (id, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programnotificationtemplate; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programnotificationtemplate (programnotificationtemplateid, uid, code, created, lastupdated, name, relativescheduleddays, usergroupid, subjecttemplate, messagetemplate, notificationtrigger, notificationrecipienttype, programstageid, programid) FROM stdin;
\.


--
-- Data for Name: programnotificationtemplate_deliverychannel; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programnotificationtemplate_deliverychannel (programnotificationtemplatedeliverychannelid, deliverychannel) FROM stdin;
\.


--
-- Data for Name: programrule; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programrule (programruleid, uid, code, created, lastupdated, name, description, programid, programstageid, rulecondition, priority) FROM stdin;
\.


--
-- Data for Name: programruleaction; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programruleaction (programruleactionid, uid, code, created, lastupdated, programruleid, actiontype, dataelementid, trackedentityattributeid, programindicatorid, programstagesectionid, programstageid, location, content, data) FROM stdin;
\.


--
-- Data for Name: programruletranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programruletranslations (programruleid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programrulevariable; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programrulevariable (programrulevariableid, uid, code, created, lastupdated, name, programid, sourcetype, trackedentityattributeid, dataelementid, usecodeforoptionset, programstageid) FROM stdin;
\.


--
-- Data for Name: programstage; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programstage (programstageid, uid, code, created, lastupdated, name, description, mindaysfromstart, programid, repeatable, dataentryformid, standardinterval, executiondatelabel, autogenerateevent, validcompleteonly, displaygenerateeventbox, capturecoordinates, generatedbyenrollmentdate, blockentryform, remindcompleted, allowgeneratenextvisit, openafterenrollment, reportdatetouse, pregenerateuid, hideduedate, sort_order, periodtypeid) FROM stdin;
\.


--
-- Data for Name: programstageattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programstageattributevalues (programstageid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: programstagedataelement; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programstagedataelement (programstagedataelementid, uid, code, created, lastupdated, programstageid, dataelementid, compulsory, allowprovidedelsewhere, sort_order, displayinreports, allowfuturedate, programstagesectionid, section_sort_order) FROM stdin;
\.


--
-- Data for Name: programstageinstance; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programstageinstance (programstageinstanceid, uid, created, lastupdated, programinstanceid, programstageid, attributeoptioncomboid, storedby, duedate, executiondate, organisationunitid, status, longitude, latitude, completedby, completeddate) FROM stdin;
\.


--
-- Data for Name: programstageinstance_messageconversation; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programstageinstance_messageconversation (programstageinstanceid, sort_order, messageconversationid) FROM stdin;
\.


--
-- Data for Name: programstageinstancecomments; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programstageinstancecomments (programstageinstanceid, sort_order, trackedentitycommentid) FROM stdin;
\.


--
-- Data for Name: programstagesection; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programstagesection (programstagesectionid, uid, code, created, lastupdated, name, programstageid, sortorder) FROM stdin;
\.


--
-- Data for Name: programstagesection_programindicators; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programstagesection_programindicators (programstagesectionid, sort_order, programindicatorid) FROM stdin;
\.


--
-- Data for Name: programstagesectiontranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programstagesectiontranslations (programstagesectionid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programstagetranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programstagetranslations (programstageid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programtranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programtranslations (programid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programusergroupaccesses (programid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: programvalidation; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programvalidation (programvalidationid, uid, code, created, lastupdated, name, leftprogramexpressionid, operator, rightprogramexpressionid, programid) FROM stdin;
\.


--
-- Data for Name: programvalidationtranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY programvalidationtranslations (programvalidationid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: pushanalysis; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY pushanalysis (pushanalysisid, uid, code, created, lastupdated, name, title, message, enabled, lastrun, schedulingdayoffrequency, schedulingfrequency, dashboard) FROM stdin;
\.


--
-- Data for Name: pushanalysisrecipientusergroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY pushanalysisrecipientusergroups (usergroupid, elt) FROM stdin;
\.


--
-- Data for Name: relationship; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY relationship (relationshipid, trackedentityinstanceaid, relationshiptypeid, trackedentityinstancebid) FROM stdin;
\.


--
-- Data for Name: relationshiptype; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY relationshiptype (relationshiptypeid, uid, code, created, lastupdated, name, a_is_to_b, b_is_to_a) FROM stdin;
\.


--
-- Data for Name: relationshiptypetranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY relationshiptypetranslations (relationshiptypeid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: relativeperiods; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY relativeperiods (relativeperiodsid, thismonth, lastmonth, thisbimonth, lastbimonth, thisquarter, lastquarter, thissixmonth, lastsixmonth, monthsthisyear, quartersthisyear, thisyear, monthslastyear, quarterslastyear, lastyear, last5years, last12months, last6months, last3months, last6bimonths, last4quarters, last2sixmonths, thisfinancialyear, lastfinancialyear, last5financialyears, thisweek, lastweek, last4weeks, last12weeks, last52weeks) FROM stdin;
\.


--
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY report (reportid, uid, code, created, lastupdated, name, type, designcontent, reporttableid, relativeperiodsid, paramreportingmonth, paramorganisationunit, cachestrategy, externalaccess, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: reporttable; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY reporttable (reporttableid, uid, code, created, lastupdated, name, description, regression, cumulative, relativeperiodsid, paramreportingmonth, paramgrandparentorganisationunit, paramparentorganisationunit, paramorganisationunit, sortorder, toplimit, rowtotals, coltotals, rowsubtotals, colsubtotals, hideemptyrows, aggregationtype, completedonly, title, digitgroupseparator, displaydensity, fontsize, userorganisationunit, userorganisationunitchildren, userorganisationunitgrandchildren, legendsetid, legenddisplaystyle, showhierarchy, showdimensionlabels, skiprounding, externalaccess, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: reporttable_categorydimensions; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY reporttable_categorydimensions (reporttableid, sort_order, categorydimensionid) FROM stdin;
\.


--
-- Data for Name: reporttable_categoryoptiongroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY reporttable_categoryoptiongroups (reporttableid, sort_order, categoryoptiongroupid) FROM stdin;
\.


--
-- Data for Name: reporttable_columns; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY reporttable_columns (reporttableid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: reporttable_datadimensionitems; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY reporttable_datadimensionitems (reporttableid, sort_order, datadimensionitemid) FROM stdin;
\.


--
-- Data for Name: reporttable_dataelementgroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY reporttable_dataelementgroups (reporttableid, sort_order, dataelementgroupid) FROM stdin;
\.


--
-- Data for Name: reporttable_filters; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY reporttable_filters (reporttableid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: reporttable_itemorgunitgroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY reporttable_itemorgunitgroups (reporttableid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: reporttable_organisationunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY reporttable_organisationunits (reporttableid, sort_order, organisationunitid) FROM stdin;
\.


--
-- Data for Name: reporttable_orgunitgroups; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY reporttable_orgunitgroups (reporttableid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: reporttable_orgunitlevels; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY reporttable_orgunitlevels (reporttableid, sort_order, orgunitlevel) FROM stdin;
\.


--
-- Data for Name: reporttable_periods; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY reporttable_periods (reporttableid, sort_order, periodid) FROM stdin;
\.


--
-- Data for Name: reporttable_rows; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY reporttable_rows (reporttableid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: reporttabletranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY reporttabletranslations (reporttableid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: reporttableusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY reporttableusergroupaccesses (reporttableid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: reporttranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY reporttranslations (reportid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: reportusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY reportusergroupaccesses (reportid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: section; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY section (sectionid, uid, code, created, lastupdated, name, description, datasetid, sortorder) FROM stdin;
\.


--
-- Data for Name: sectionattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY sectionattributevalues (sectionid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: sectiondataelements; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY sectiondataelements (sectionid, sort_order, dataelementid) FROM stdin;
\.


--
-- Data for Name: sectiongreyedfields; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY sectiongreyedfields (sectionid, dataelementoperandid) FROM stdin;
\.


--
-- Data for Name: sectionindicators; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY sectionindicators (sectionid, sort_order, indicatorid) FROM stdin;
\.


--
-- Data for Name: smscodes; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY smscodes (smscodeid, code, formula, compulsory, dataelementid, trackedentityattributeid, optionid) FROM stdin;
\.


--
-- Data for Name: smscommandcodes; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY smscommandcodes (id, codeid) FROM stdin;
\.


--
-- Data for Name: smscommands; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY smscommands (smscommandid, name, parser, parsertype, separatorkey, codeseparator, defaultmessage, receivedmessage, wrongformatmessage, nousermessage, morethanoneorgunitmessage, successmessage, currentperiodusedforreporting, completenessmethod, datasetid, usergroupid, programid, programstageid) FROM stdin;
\.


--
-- Data for Name: smscommandspecialcharacters; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY smscommandspecialcharacters (smscommandid, specialcharacterid) FROM stdin;
\.


--
-- Data for Name: smsspecialcharacter; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY smsspecialcharacter (specialcharacterid, name, value) FROM stdin;
\.


--
-- Data for Name: sqlview; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY sqlview (sqlviewid, uid, code, created, lastupdated, name, description, sqlquery, type, cachestrategy, externalaccess, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: sqlviewattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY sqlviewattributevalues (sqlviewid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: sqlviewusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY sqlviewusergroupaccesses (sqlviewid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: systemsetting; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY systemsetting (systemsettingid, name, value) FROM stdin;
707	applicationTitle	\\xaced00057400054a50484553
708	keyApplicationIntro	\\xaced000574001a57656c636f6d6520746f20506172746e65727320506f7274616c
709	keyApplicationNotification	\\xaced000574005e4c6f67696e20776974682070726f76696465642063726564656e7469616c732e20546f2072657175657374206163636573732073656e6420616e20656d61696c20746f206a70686573406865616c746869742e756f6e62692e61632e6b65
710	keyStyle	\\xaced000574000f677265656e2f677265656e2e637373
711	keyFlag	\\xaced0005740006706570666172
\.


--
-- Data for Name: trackedentity; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentity (trackedentityid, uid, code, created, lastupdated, name, description) FROM stdin;
16	MCPQUTHX1Ze	Person	2017-01-27 00:00:00	2017-01-27 00:00:00	Person	Person
\.


--
-- Data for Name: trackedentityattribute; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentityattribute (trackedentityattributeid, uid, code, created, lastupdated, name, shortname, description, valuetype, aggregationtype, trackedentityattributegroupid, optionsetid, trackedentityid, legendsetid, inherit, expression, displayonvisitschedule, sortorderinvisitschedule, displayinlistnoprogram, sortorderinlistnoprogram, confidential, uniquefield, generated, pattern, orgunitscope, programscope, searchscope, userid, publicaccess, sort_order) FROM stdin;
\.


--
-- Data for Name: trackedentityattributeattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentityattributeattributevalues (trackedentityattributeid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: trackedentityattributedimension; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentityattributedimension (trackedentityattributedimensionid, trackedentityattributeid, legendsetid, filter) FROM stdin;
\.


--
-- Data for Name: trackedentityattributegroup; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentityattributegroup (trackedentityattributegroupid, uid, code, created, lastupdated, name, description, sortorder) FROM stdin;
\.


--
-- Data for Name: trackedentityattributegrouptranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentityattributegrouptranslations (trackedentityattributegroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: trackedentityattributereservedvalue; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentityattributereservedvalue (trackedentityattributereservedvalueid, trackedentityattributeid, trackedentityinstanceid, created, expirydate, value) FROM stdin;
\.


--
-- Data for Name: trackedentityattributetranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentityattributetranslations (trackedentityattributeid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: trackedentityattributeusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentityattributeusergroupaccesses (trackedentityattributeid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: trackedentityattributevalue; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentityattributevalue (trackedentityinstanceid, trackedentityattributeid, created, lastupdated, value, encryptedvalue) FROM stdin;
\.


--
-- Data for Name: trackedentityattributevalueaudit; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentityattributevalueaudit (trackedentityattributevalueauditid, trackedentityinstanceid, trackedentityattributeid, value, encryptedvalue, created, modifiedby, audittype) FROM stdin;
\.


--
-- Data for Name: trackedentityattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentityattributevalues (trackedentityid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: trackedentitycomment; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentitycomment (trackedentitycommentid, commenttext, createddate, creator) FROM stdin;
\.


--
-- Data for Name: trackedentitydataelementdimension; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentitydataelementdimension (trackedentitydataelementdimensionid, dataelementid, legendsetid, filter) FROM stdin;
\.


--
-- Data for Name: trackedentitydatavalue; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentitydatavalue (programstageinstanceid, dataelementid, value, created, lastupdated, providedelsewhere, storedby) FROM stdin;
\.


--
-- Data for Name: trackedentitydatavalueaudit; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentitydatavalueaudit (trackedentitydatavalueauditid, programstageinstanceid, dataelementid, value, created, providedelsewhere, modifiedby, audittype) FROM stdin;
\.


--
-- Data for Name: trackedentityinstance; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentityinstance (trackedentityinstanceid, uid, code, created, lastupdated, inactive, representativeid, organisationunitid, trackedentityid) FROM stdin;
\.


--
-- Data for Name: trackedentityprogramindicatordimension; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentityprogramindicatordimension (trackedentityprogramindicatordimensionid, programindicatorid, legendsetid, filter) FROM stdin;
\.


--
-- Data for Name: trackedentitytranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY trackedentitytranslations (trackedentityid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: userapps; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY userapps (userinfoid, sort_order, app) FROM stdin;
\.


--
-- Data for Name: userattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY userattributevalues (userinfoid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: userdatavieworgunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY userdatavieworgunits (userinfoid, organisationunitid) FROM stdin;
46	458
\.


--
-- Data for Name: usergroup; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY usergroup (usergroupid, uid, code, created, lastupdated, name, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: usergroupaccess; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY usergroupaccess (usergroupaccessid, access, usergroupid) FROM stdin;
\.


--
-- Data for Name: usergroupattributevalues; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY usergroupattributevalues (usergroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: usergroupmanaged; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY usergroupmanaged (managedbygroupid, managedgroupid) FROM stdin;
\.


--
-- Data for Name: usergroupmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY usergroupmembers (userid, usergroupid) FROM stdin;
\.


--
-- Data for Name: usergrouptranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY usergrouptranslations (usergroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: usergroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY usergroupusergroupaccesses (usergroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: userinfo; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY userinfo (userinfoid, uid, code, lastupdated, created, surname, firstname, email, phonenumber, jobtitle, introduction, gender, birthday, nationality, employer, education, interests, languages, lastcheckedinterpretations) FROM stdin;
46	M5zQapPyTZI	admin	2017-01-27 12:25:18.471	2017-01-27 08:37:11.794	admin	admin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: userkeyjsonvalue; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY userkeyjsonvalue (userkeyjsonvalueid, uid, code, created, lastupdated, userid, namespace, userkey, value, encrypted_value, encrypted) FROM stdin;
\.


--
-- Data for Name: usermembership; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY usermembership (userinfoid, organisationunitid) FROM stdin;
46	458
\.


--
-- Data for Name: usermessage; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY usermessage (usermessageid, usermessagekey, userid, isread, isfollowup) FROM stdin;
\.


--
-- Data for Name: userrole; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY userrole (userroleid, uid, code, created, lastupdated, name, description, userid, publicaccess) FROM stdin;
47	yrB6vc5Ip3r	Superuser	2017-01-27 08:37:11.808	2017-01-27 08:37:11.808	Superuser	Superuser	\N	--------
\.


--
-- Data for Name: userroleauthorities; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY userroleauthorities (userroleid, authority) FROM stdin;
47	F_USERGROUP_MANAGING_RELATIONSHIPS_ADD
47	F_ORGUNITGROUP_PRIVATE_ADD
47	F_DATAELEMENTGROUP_PUBLIC_ADD
47	F_USER_GROUPS_READ_ONLY_ADD_MEMBERS
47	F_DATAELEMENT_DELETE
47	F_OPTIONGROUP_DELETE
47	F_LEGEND_SET_PRIVATE_ADD
47	F_CATEGORY_PRIVATE_ADD
47	F_INDICATORGROUPSET_PUBLIC_ADD
47	F_EXTERNAL_MAP_LAYER_PRIVATE_ADD
47	F_REPORTTABLE_EXTERNAL
47	F_CATEGORY_OPTION_PRIVATE_ADD
47	F_GIS_ADMIN
47	F_CATEGORY_OPTION_GROUP_PUBLIC_ADD
47	F_ORGUNITGROUPSET_DELETE
47	F_INDICATOR_DELETE
47	F_ORGUNITGROUPSET_PRIVATE_ADD
47	F_VIEW_UNAPPROVED_DATA
47	F_USERGROUP_MANAGING_RELATIONSHIPS_VIEW
47	F_PREDICTOR_ADD
47	F_OPTIONGROUPSET_DELETE
47	F_USERGROUP_PUBLIC_ADD
47	F_OAUTH2_CLIENT_MANAGE
47	F_APPROVE_DATA_LOWER_LEVELS
47	F_ORGUNITGROUP_PUBLIC_ADD
47	F_REPORTTABLE_PUBLIC_ADD
47	F_CATEGORY_COMBO_PRIVATE_ADD
47	F_TRACKED_ENTITY_INSTANCE_DELETE
47	F_OPTIONSET_PUBLIC_ADD
47	F_ORGANISATIONUNIT_MOVE
47	F_EXTERNAL_MAP_LAYER_PUBLIC_ADD
47	F_INDICATORGROUP_DELETE
47	F_ORGANISATIONUNIT_DELETE
47	F_OPTIONGROUPSET_PRIVATE_ADD
47	F_ORGUNITGROUPSET_PUBLIC_ADD
47	F_SQLVIEW_EXTERNAL
47	F_CATEGORY_COMBO_DELETE
47	F_DASHBOARD_PUBLIC_ADD
47	F_CONSTANT_DELETE
47	F_METADATA_IMPORT
47	F_INDICATORGROUPSET_PRIVATE_ADD
47	F_PREDICTOR_DELETE
47	F_CHART_PUBLIC_ADD
47	F_CHART_EXTERNAL
47	F_METADATA_EXPORT
47	F_PROGRAM_UNENROLLMENT
47	F_DATAELEMENTGROUP_PRIVATE_ADD
47	F_APPROVE_DATA
47	F_CATEGORY_OPTION_GROUP_SET_PUBLIC_ADD
47	F_METADATA_MANAGE
47	F_DATAELEMENT_PRIVATE_ADD
47	F_TRACKED_ENTITY_INSTANCE_SEARCH_IN_ALL_ORGUNITS
47	ALL
47	F_LEGEND_DELETE
47	F_CATEGORY_OPTION_GROUP_SET_PRIVATE_ADD
47	F_MAP_PUBLIC_ADD
47	F_CATEGORY_OPTION_GROUP_SET_DELETE
47	F_USER_ADD_WITHIN_MANAGED_GROUP
47	F_PROGRAM_ENROLLMENT
47	F_ORGANISATIONUNIT_ADD
47	F_LEGEND_SET_PUBLIC_ADD
47	F_CONSTANT_ADD
47	F_PUSH_ANALYSIS_DELETE
47	F_REPLICATE_USER
47	F_INSERT_CUSTOM_JS_CSS
47	F_DATAELEMENTGROUPSET_DELETE
47	F_LEGEND_SET_DELETE
47	F_INDICATORTYPE_ADD
47	F_INDICATOR_PUBLIC_ADD
47	F_INDICATORGROUP_PUBLIC_ADD
47	F_INDICATOR_PRIVATE_ADD
47	F_TRACKED_ENTITY_INSTANCE_ADD
47	F_PUSH_ANALYSIS_ADD
47	F_EXTERNAL_MAP_LAYER_DELETE
47	F_PROGRAM_DASHBOARD_CONFIG_ADMIN
47	F_ATTRIBUTE_ADD
47	F_ORGANISATIONUNITLEVEL_UPDATE
47	F_CATEGORY_OPTION_PUBLIC_ADD
47	F_CATEGORY_OPTION_DELETE
47	F_DATAELEMENT_PUBLIC_ADD
47	F_OPTIONSET_PRIVATE_ADD
47	F_CATEGORY_OPTION_GROUP_DELETE
47	F_OPTIONGROUP_PRIVATE_ADD
47	F_TRACKED_ENTITY_INSTANCE_SEARCH
47	F_ORGUNITGROUP_DELETE
47	F_DATAELEMENTGROUPSET_PRIVATE_ADD
47	F_LEGEND_ADD
47	F_CATEGORY_OPTION_GROUP_PRIVATE_ADD
47	F_CATEGORY_PUBLIC_ADD
47	F_ATTRIBUTE_DELETE
47	F_OPTIONSET_DELETE
47	F_CATEGORY_COMBO_PUBLIC_ADD
47	F_INDICATORGROUPSET_DELETE
47	F_ACCEPT_DATA_LOWER_LEVELS
47	F_OPTIONGROUPSET_PUBLIC_ADD
47	F_CATEGORY_DELETE
47	F_OPTIONGROUP_PUBLIC_ADD
47	F_TRACKED_ENTITY_DATAVALUE_ADD
47	F_INDICATORTYPE_DELETE
47	F_MAP_EXTERNAL
47	F_INDICATORGROUP_PRIVATE_ADD
47	F_TRACKED_ENTITY_DATAVALUE_DELETE
47	F_DATAELEMENTGROUP_DELETE
47	F_DATAELEMENTGROUPSET_PUBLIC_ADD
\.


--
-- Data for Name: userroledataset; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY userroledataset (userroleid, datasetid) FROM stdin;
\.


--
-- Data for Name: userrolemembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY userrolemembers (userid, userroleid) FROM stdin;
46	47
\.


--
-- Data for Name: userroletranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY userroletranslations (userroleid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: userroleusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY userroleusergroupaccesses (userroleid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY users (userid, uid, code, created, lastupdated, creatoruserid, username, password, externalauth, openid, ldapid, passwordlastupdated, lastlogin, restoretoken, restorecode, restoreexpiry, selfregistered, invitation, disabled) FROM stdin;
46	KvMx6c1eoYo	admin	2017-01-27 08:37:11.848	2017-01-27 20:27:53.771	46	admin	$2a$10$DYEN0eKxChY.WJPM4.b8y.kKO5UDylo2ztE1Vp3IYkHOQrNNJYUoK	f	\N	\N	2017-01-27 12:25:18.353	2017-01-27 20:27:53.766	\N	\N	\N	f	f	f
\.


--
-- Data for Name: users_catdimensionconstraints; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY users_catdimensionconstraints (userid, dataelementcategoryid) FROM stdin;
\.


--
-- Data for Name: users_cogsdimensionconstraints; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY users_cogsdimensionconstraints (userid, categoryoptiongroupsetid) FROM stdin;
\.


--
-- Data for Name: usersetting; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY usersetting (userinfoid, name, value) FROM stdin;
46	keyUiLocale	\\xaced0005737200106a6176612e7574696c2e4c6f63616c657ef811609c30f9ec03000649000868617368636f64654c0007636f756e7472797400124c6a6176612f6c616e672f537472696e673b4c000a657874656e73696f6e7371007e00014c00086c616e677561676571007e00014c000673637269707471007e00014c000776617269616e7471007e00017870ffffffff74000071007e0003740002656e71007e000371007e000378
46	keyDbLocale	\N
\.


--
-- Data for Name: userteisearchorgunits; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY userteisearchorgunits (userinfoid, organisationunitid) FROM stdin;
46	458
\.


--
-- Data for Name: validationcriteria; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY validationcriteria (validationcriteriaid, uid, code, created, lastupdated, name, description, property, operator, value) FROM stdin;
\.


--
-- Data for Name: validationcriteriatranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY validationcriteriatranslations (validationcriteriaid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: validationrule; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY validationrule (validationruleid, uid, code, created, lastupdated, name, description, instruction, importance, operator, leftexpressionid, rightexpressionid, periodtypeid) FROM stdin;
\.


--
-- Data for Name: validationrulegroup; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY validationrulegroup (validationrulegroupid, uid, code, created, lastupdated, name, description, alertbyorgunits, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: validationrulegroupmembers; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY validationrulegroupmembers (validationgroupid, validationruleid) FROM stdin;
\.


--
-- Data for Name: validationrulegrouptranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY validationrulegrouptranslations (validationrulegroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: validationrulegroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY validationrulegroupusergroupaccesses (validationrulegroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: validationrulegroupusergroupstoalert; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY validationrulegroupusergroupstoalert (validationgroupid, usergroupid) FROM stdin;
\.


--
-- Data for Name: validationruletranslations; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY validationruletranslations (validationruleid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: version; Type: TABLE DATA; Schema: public; Owner: dhis
--

COPY version (versionid, versionkey, versionvalue) FROM stdin;
442	organisationUnit	852a1105-bc47-4f9d-bf4e-25a3886cbd43
\.


--
-- Name: agencyunitusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY agencyunitusergroupaccesses
    ADD CONSTRAINT agencyunitusergroupaccesses_pkey PRIMARY KEY (agencyunitid, usergroupaccessid);


--
-- Name: attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY attribute
    ADD CONSTRAINT attribute_pkey PRIMARY KEY (attributeid);


--
-- Name: attributetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY attributetranslations
    ADD CONSTRAINT attributetranslations_pkey PRIMARY KEY (attributeid, objecttranslationid);


--
-- Name: attributevalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY attributevalue
    ADD CONSTRAINT attributevalue_pkey PRIMARY KEY (attributevalueid);


--
-- Name: categories_categoryoptions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categories_categoryoptions
    ADD CONSTRAINT categories_categoryoptions_pkey PRIMARY KEY (categoryid, sort_order);


--
-- Name: categorycombo_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorycombo
    ADD CONSTRAINT categorycombo_pkey PRIMARY KEY (categorycomboid);


--
-- Name: categorycombos_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorycombos_categories
    ADD CONSTRAINT categorycombos_categories_pkey PRIMARY KEY (categorycomboid, sort_order);


--
-- Name: categorycombos_optioncombos_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorycombos_optioncombos
    ADD CONSTRAINT categorycombos_optioncombos_pkey PRIMARY KEY (categoryoptioncomboid);


--
-- Name: categorycombotranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorycombotranslations
    ADD CONSTRAINT categorycombotranslations_pkey PRIMARY KEY (categorycomboid, objecttranslationid);


--
-- Name: categorycombousergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorycombousergroupaccesses
    ADD CONSTRAINT categorycombousergroupaccesses_pkey PRIMARY KEY (categorycomboid, usergroupaccessid);


--
-- Name: categorydimension_items_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorydimension_items
    ADD CONSTRAINT categorydimension_items_pkey PRIMARY KEY (categorydimensionid, sort_order);


--
-- Name: categorydimension_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorydimension
    ADD CONSTRAINT categorydimension_pkey PRIMARY KEY (categorydimensionid);


--
-- Name: categoryoption_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoption_organisationunits
    ADD CONSTRAINT categoryoption_organisationunits_pkey PRIMARY KEY (categoryoptionid, organisationunitid);


--
-- Name: categoryoptioncombo_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptioncombo
    ADD CONSTRAINT categoryoptioncombo_pkey PRIMARY KEY (categoryoptioncomboid);


--
-- Name: categoryoptioncomboattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptioncomboattributevalues
    ADD CONSTRAINT categoryoptioncomboattributevalues_pkey PRIMARY KEY (categoryoptioncomboid, attributevalueid);


--
-- Name: categoryoptioncombos_categoryoptions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptioncombos_categoryoptions
    ADD CONSTRAINT categoryoptioncombos_categoryoptions_pkey PRIMARY KEY (categoryoptioncomboid, categoryoptionid);


--
-- Name: categoryoptioncombotranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptioncombotranslations
    ADD CONSTRAINT categoryoptioncombotranslations_pkey PRIMARY KEY (categoryoptioncomboid, objecttranslationid);


--
-- Name: categoryoptiongroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroup
    ADD CONSTRAINT categoryoptiongroup_pkey PRIMARY KEY (categoryoptiongroupid);


--
-- Name: categoryoptiongroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupattributevalues
    ADD CONSTRAINT categoryoptiongroupattributevalues_pkey PRIMARY KEY (categoryoptiongroupid, attributevalueid);


--
-- Name: categoryoptiongroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupmembers
    ADD CONSTRAINT categoryoptiongroupmembers_pkey PRIMARY KEY (categoryoptiongroupid, categoryoptionid);


--
-- Name: categoryoptiongroupset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupset
    ADD CONSTRAINT categoryoptiongroupset_pkey PRIMARY KEY (categoryoptiongroupsetid);


--
-- Name: categoryoptiongroupsetmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupsetmembers
    ADD CONSTRAINT categoryoptiongroupsetmembers_pkey PRIMARY KEY (categoryoptiongroupsetid, sort_order);


--
-- Name: categoryoptiongroupsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupsettranslations
    ADD CONSTRAINT categoryoptiongroupsettranslations_pkey PRIMARY KEY (categoryoptiongroupsetid, objecttranslationid);


--
-- Name: categoryoptiongroupsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupsetusergroupaccesses
    ADD CONSTRAINT categoryoptiongroupsetusergroupaccesses_pkey PRIMARY KEY (categoryoptiongroupsetid, usergroupaccessid);


--
-- Name: categoryoptiongrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongrouptranslations
    ADD CONSTRAINT categoryoptiongrouptranslations_pkey PRIMARY KEY (categoryoptiongroupid, objecttranslationid);


--
-- Name: categoryoptiongroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupusergroupaccesses
    ADD CONSTRAINT categoryoptiongroupusergroupaccesses_pkey PRIMARY KEY (categoryoptiongroupid, usergroupaccessid);


--
-- Name: categoryoptiontranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiontranslations
    ADD CONSTRAINT categoryoptiontranslations_pkey PRIMARY KEY (categoryoptionid, objecttranslationid);


--
-- Name: chart_categorydimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_categorydimensions
    ADD CONSTRAINT chart_categorydimensions_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_categoryoptiongroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_categoryoptiongroups
    ADD CONSTRAINT chart_categoryoptiongroups_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_datadimensionitems_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_datadimensionitems
    ADD CONSTRAINT chart_datadimensionitems_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_dataelementgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_dataelementgroups
    ADD CONSTRAINT chart_dataelementgroups_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_filters
    ADD CONSTRAINT chart_filters_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_itemorgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_itemorgunitgroups
    ADD CONSTRAINT chart_itemorgunitgroups_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_organisationunits
    ADD CONSTRAINT chart_organisationunits_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_orgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_orgunitgroups
    ADD CONSTRAINT chart_orgunitgroups_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_orgunitlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_orgunitlevels
    ADD CONSTRAINT chart_orgunitlevels_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_periods
    ADD CONSTRAINT chart_periods_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart
    ADD CONSTRAINT chart_pkey PRIMARY KEY (chartid);


--
-- Name: charttranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY charttranslations
    ADD CONSTRAINT charttranslations_pkey PRIMARY KEY (chartid, objecttranslationid);


--
-- Name: chartusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chartusergroupaccesses
    ADD CONSTRAINT chartusergroupaccesses_pkey PRIMARY KEY (chartid, usergroupaccessid);


--
-- Name: color_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY color
    ADD CONSTRAINT color_pkey PRIMARY KEY (colorid);


--
-- Name: colorset_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY colorset_colors
    ADD CONSTRAINT colorset_colors_pkey PRIMARY KEY (colorsetid, sort_order);


--
-- Name: colorset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY colorset
    ADD CONSTRAINT colorset_pkey PRIMARY KEY (colorsetid);


--
-- Name: colorsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY colorsettranslations
    ADD CONSTRAINT colorsettranslations_pkey PRIMARY KEY (colorsetid, objecttranslationid);


--
-- Name: colortranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY colortranslations
    ADD CONSTRAINT colortranslations_pkey PRIMARY KEY (colorid, objecttranslationid);


--
-- Name: completedatasetregistration_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY completedatasetregistration
    ADD CONSTRAINT completedatasetregistration_pkey PRIMARY KEY (datasetid, periodid, sourceid, attributeoptioncomboid);


--
-- Name: configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT configuration_pkey PRIMARY KEY (configurationid);


--
-- Name: constant_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY constant
    ADD CONSTRAINT constant_pkey PRIMARY KEY (constantid);


--
-- Name: constantattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY constantattributevalues
    ADD CONSTRAINT constantattributevalues_pkey PRIMARY KEY (constantid, attributevalueid);


--
-- Name: constanttranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY constanttranslations
    ADD CONSTRAINT constanttranslations_pkey PRIMARY KEY (colorid, objecttranslationid);


--
-- Name: constantusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY constantusergroupaccesses
    ADD CONSTRAINT constantusergroupaccesses_pkey PRIMARY KEY (constantid, usergroupaccessid);


--
-- Name: dashboard_items_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboard_items
    ADD CONSTRAINT dashboard_items_pkey PRIMARY KEY (dashboardid, sort_order);


--
-- Name: dashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboard
    ADD CONSTRAINT dashboard_pkey PRIMARY KEY (dashboardid);


--
-- Name: dashboarditem_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditem
    ADD CONSTRAINT dashboarditem_pkey PRIMARY KEY (dashboarditemid);


--
-- Name: dashboarditem_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditem_reports
    ADD CONSTRAINT dashboarditem_reports_pkey PRIMARY KEY (dashboarditemid, sort_order);


--
-- Name: dashboarditem_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditem_resources
    ADD CONSTRAINT dashboarditem_resources_pkey PRIMARY KEY (dashboarditemid, sort_order);


--
-- Name: dashboarditem_users_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditem_users
    ADD CONSTRAINT dashboarditem_users_pkey PRIMARY KEY (dashboarditemid, sort_order);


--
-- Name: dashboarditemtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditemtranslations
    ADD CONSTRAINT dashboarditemtranslations_pkey PRIMARY KEY (dashboarditemid, objecttranslationid);


--
-- Name: dashboardtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboardtranslations
    ADD CONSTRAINT dashboardtranslations_pkey PRIMARY KEY (dashboardid, objecttranslationid);


--
-- Name: dashboardusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboardusergroupaccesses
    ADD CONSTRAINT dashboardusergroupaccesses_pkey PRIMARY KEY (dashboardid, usergroupaccessid);


--
-- Name: dataapproval_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapproval
    ADD CONSTRAINT dataapproval_pkey PRIMARY KEY (dataapprovalid);


--
-- Name: dataapproval_unique_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapproval
    ADD CONSTRAINT dataapproval_unique_key UNIQUE (dataapprovallevelid, workflowid, periodid, organisationunitid, attributeoptioncomboid);


--
-- Name: dataapprovallevel_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovallevel
    ADD CONSTRAINT dataapprovallevel_pkey PRIMARY KEY (dataapprovallevelid);


--
-- Name: dataapprovalleveltranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovalleveltranslations
    ADD CONSTRAINT dataapprovalleveltranslations_pkey PRIMARY KEY (dataapprovallevelid, objecttranslationid);


--
-- Name: dataapprovallevelusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovallevelusergroupaccesses
    ADD CONSTRAINT dataapprovallevelusergroupaccesses_pkey PRIMARY KEY (dataapprovallevelid, usergroupaccessid);


--
-- Name: dataapprovalworkflow_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovalworkflow
    ADD CONSTRAINT dataapprovalworkflow_pkey PRIMARY KEY (workflowid);


--
-- Name: dataapprovalworkflowlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovalworkflowlevels
    ADD CONSTRAINT dataapprovalworkflowlevels_pkey PRIMARY KEY (workflowid, dataapprovallevelid);


--
-- Name: dataapprovalworkflowtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovalworkflowtranslations
    ADD CONSTRAINT dataapprovalworkflowtranslations_pkey PRIMARY KEY (workflowid, objecttranslationid);


--
-- Name: dataapprovalworkflowusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovalworkflowusergroupaccesses
    ADD CONSTRAINT dataapprovalworkflowusergroupaccesses_pkey PRIMARY KEY (workflowid, usergroupaccessid);


--
-- Name: datadimensionitem_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datadimensionitem
    ADD CONSTRAINT datadimensionitem_pkey PRIMARY KEY (datadimensionitemid);


--
-- Name: dataelement_code_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT dataelement_code_key UNIQUE (code);


--
-- Name: dataelement_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT dataelement_pkey PRIMARY KEY (dataelementid);


--
-- Name: dataelementaggregationlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementaggregationlevels
    ADD CONSTRAINT dataelementaggregationlevels_pkey PRIMARY KEY (dataelementid, sort_order);


--
-- Name: dataelementattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementattributevalues
    ADD CONSTRAINT dataelementattributevalues_pkey PRIMARY KEY (dataelementid, attributevalueid);


--
-- Name: dataelementcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategory
    ADD CONSTRAINT dataelementcategory_pkey PRIMARY KEY (categoryid);


--
-- Name: dataelementcategoryoption_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategoryoption
    ADD CONSTRAINT dataelementcategoryoption_pkey PRIMARY KEY (categoryoptionid);


--
-- Name: dataelementcategoryoptionattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategoryoptionattributevalues
    ADD CONSTRAINT dataelementcategoryoptionattributevalues_pkey PRIMARY KEY (categoryoptionid, attributevalueid);


--
-- Name: dataelementcategoryoptionusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategoryoptionusergroupaccesses
    ADD CONSTRAINT dataelementcategoryoptionusergroupaccesses_pkey PRIMARY KEY (categoryoptionid, usergroupaccessid);


--
-- Name: dataelementcategorytranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategorytranslations
    ADD CONSTRAINT dataelementcategorytranslations_pkey PRIMARY KEY (categoryid, objecttranslationid);


--
-- Name: dataelementcategoryusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategoryusergroupaccesses
    ADD CONSTRAINT dataelementcategoryusergroupaccesses_pkey PRIMARY KEY (categoryid, usergroupaccessid);


--
-- Name: dataelementgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroup
    ADD CONSTRAINT dataelementgroup_pkey PRIMARY KEY (dataelementgroupid);


--
-- Name: dataelementgroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupattributevalues
    ADD CONSTRAINT dataelementgroupattributevalues_pkey PRIMARY KEY (dataelementgroupid, attributevalueid);


--
-- Name: dataelementgroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupmembers
    ADD CONSTRAINT dataelementgroupmembers_pkey PRIMARY KEY (dataelementgroupid, dataelementid);


--
-- Name: dataelementgroupset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupset
    ADD CONSTRAINT dataelementgroupset_pkey PRIMARY KEY (dataelementgroupsetid);


--
-- Name: dataelementgroupsetmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupsetmembers
    ADD CONSTRAINT dataelementgroupsetmembers_pkey PRIMARY KEY (dataelementgroupsetid, sort_order);


--
-- Name: dataelementgroupsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupsettranslations
    ADD CONSTRAINT dataelementgroupsettranslations_pkey PRIMARY KEY (dataelementgroupsetid, objecttranslationid);


--
-- Name: dataelementgroupsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupsetusergroupaccesses
    ADD CONSTRAINT dataelementgroupsetusergroupaccesses_pkey PRIMARY KEY (dataelementgroupsetid, usergroupaccessid);


--
-- Name: dataelementgrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgrouptranslations
    ADD CONSTRAINT dataelementgrouptranslations_pkey PRIMARY KEY (dataelementgroupid, objecttranslationid);


--
-- Name: dataelementgroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupusergroupaccesses
    ADD CONSTRAINT dataelementgroupusergroupaccesses_pkey PRIMARY KEY (dataelementgroupid, usergroupaccessid);


--
-- Name: dataelementoperand_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementoperand
    ADD CONSTRAINT dataelementoperand_pkey PRIMARY KEY (dataelementoperandid);


--
-- Name: dataelementtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementtranslations
    ADD CONSTRAINT dataelementtranslations_pkey PRIMARY KEY (dataelementid, objecttranslationid);


--
-- Name: dataelementusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementusergroupaccesses
    ADD CONSTRAINT dataelementusergroupaccesses_pkey PRIMARY KEY (dataelementid, usergroupaccessid);


--
-- Name: dataentryform_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataentryform
    ADD CONSTRAINT dataentryform_pkey PRIMARY KEY (dataentryformid);


--
-- Name: dataentryformtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataentryformtranslations
    ADD CONSTRAINT dataentryformtranslations_pkey PRIMARY KEY (dataentryformid, objecttranslationid);


--
-- Name: dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT dataset_pkey PRIMARY KEY (datasetid);


--
-- Name: datasetattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetattributevalues
    ADD CONSTRAINT datasetattributevalues_pkey PRIMARY KEY (datasetid, attributevalueid);


--
-- Name: datasetelement_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetelement
    ADD CONSTRAINT datasetelement_pkey PRIMARY KEY (datasetelementid);


--
-- Name: datasetelement_unique_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetelement
    ADD CONSTRAINT datasetelement_unique_key UNIQUE (datasetid, dataelementid);


--
-- Name: datasetindicators_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetindicators
    ADD CONSTRAINT datasetindicators_pkey PRIMARY KEY (datasetid, indicatorid);


--
-- Name: datasetoperands_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetoperands
    ADD CONSTRAINT datasetoperands_pkey PRIMARY KEY (datasetid, dataelementoperandid);


--
-- Name: datasetsectiontranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetsectiontranslations
    ADD CONSTRAINT datasetsectiontranslations_pkey PRIMARY KEY (sectionid, objecttranslationid);


--
-- Name: datasetsource_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetsource
    ADD CONSTRAINT datasetsource_pkey PRIMARY KEY (datasetid, sourceid);


--
-- Name: datasettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasettranslations
    ADD CONSTRAINT datasettranslations_pkey PRIMARY KEY (datasetid, objecttranslationid);


--
-- Name: datasetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetusergroupaccesses
    ADD CONSTRAINT datasetusergroupaccesses_pkey PRIMARY KEY (datasetid, usergroupaccessid);


--
-- Name: datastatistics_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datastatistics
    ADD CONSTRAINT datastatistics_pkey PRIMARY KEY (statisticsid);


--
-- Name: datastatisticsevent_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datastatisticsevent
    ADD CONSTRAINT datastatisticsevent_pkey PRIMARY KEY (eventid);


--
-- Name: datavalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datavalue
    ADD CONSTRAINT datavalue_pkey PRIMARY KEY (dataelementid, periodid, sourceid, categoryoptioncomboid, attributeoptioncomboid);


--
-- Name: datavalueaudit_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datavalueaudit
    ADD CONSTRAINT datavalueaudit_pkey PRIMARY KEY (datavalueauditid);


--
-- Name: document_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY document
    ADD CONSTRAINT document_pkey PRIMARY KEY (documentid);


--
-- Name: documentattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY documentattributevalues
    ADD CONSTRAINT documentattributevalues_pkey PRIMARY KEY (documentid, attributevalueid);


--
-- Name: documenttranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY documenttranslations
    ADD CONSTRAINT documenttranslations_pkey PRIMARY KEY (documentid, objecttranslationid);


--
-- Name: documentusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY documentusergroupaccesses
    ADD CONSTRAINT documentusergroupaccesses_pkey PRIMARY KEY (documentid, usergroupaccessid);


--
-- Name: donorunitusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY donorunitusergroupaccesses
    ADD CONSTRAINT donorunitusergroupaccesses_pkey PRIMARY KEY (donorunitid, usergroupaccessid);


--
-- Name: eventchart_attributedimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_attributedimensions
    ADD CONSTRAINT eventchart_attributedimensions_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_columns
    ADD CONSTRAINT eventchart_columns_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_dataelementdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_dataelementdimensions
    ADD CONSTRAINT eventchart_dataelementdimensions_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_filters
    ADD CONSTRAINT eventchart_filters_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_itemorgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_itemorgunitgroups
    ADD CONSTRAINT eventchart_itemorgunitgroups_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_organisationunits
    ADD CONSTRAINT eventchart_organisationunits_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_orgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_orgunitgroups
    ADD CONSTRAINT eventchart_orgunitgroups_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_orgunitlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_orgunitlevels
    ADD CONSTRAINT eventchart_orgunitlevels_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_periods
    ADD CONSTRAINT eventchart_periods_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT eventchart_pkey PRIMARY KEY (eventchartid);


--
-- Name: eventchart_programindicatordimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_programindicatordimensions
    ADD CONSTRAINT eventchart_programindicatordimensions_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_rows
    ADD CONSTRAINT eventchart_rows_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventcharttranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventcharttranslations
    ADD CONSTRAINT eventcharttranslations_pkey PRIMARY KEY (eventchartid, objecttranslationid);


--
-- Name: eventchartusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchartusergroupaccesses
    ADD CONSTRAINT eventchartusergroupaccesses_pkey PRIMARY KEY (eventchartid, usergroupaccessid);


--
-- Name: eventreport_attributedimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_attributedimensions
    ADD CONSTRAINT eventreport_attributedimensions_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_columns
    ADD CONSTRAINT eventreport_columns_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_dataelementdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_dataelementdimensions
    ADD CONSTRAINT eventreport_dataelementdimensions_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_filters
    ADD CONSTRAINT eventreport_filters_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_itemorgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_itemorgunitgroups
    ADD CONSTRAINT eventreport_itemorgunitgroups_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_organisationunits
    ADD CONSTRAINT eventreport_organisationunits_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_orgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_orgunitgroups
    ADD CONSTRAINT eventreport_orgunitgroups_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_orgunitlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_orgunitlevels
    ADD CONSTRAINT eventreport_orgunitlevels_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_periods
    ADD CONSTRAINT eventreport_periods_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT eventreport_pkey PRIMARY KEY (eventreportid);


--
-- Name: eventreport_programindicatordimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_programindicatordimensions
    ADD CONSTRAINT eventreport_programindicatordimensions_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_rows
    ADD CONSTRAINT eventreport_rows_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreporttranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreporttranslations
    ADD CONSTRAINT eventreporttranslations_pkey PRIMARY KEY (eventreportid, objecttranslationid);


--
-- Name: eventreportusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreportusergroupaccesses
    ADD CONSTRAINT eventreportusergroupaccesses_pkey PRIMARY KEY (eventreportid, usergroupaccessid);


--
-- Name: expression_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY expression
    ADD CONSTRAINT expression_pkey PRIMARY KEY (expressionid);


--
-- Name: expressiondataelement_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY expressiondataelement
    ADD CONSTRAINT expressiondataelement_pkey PRIMARY KEY (expressionid, dataelementid);


--
-- Name: expressionsampleelement_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY expressionsampleelement
    ADD CONSTRAINT expressionsampleelement_pkey PRIMARY KEY (expressionid, dataelementid);


--
-- Name: externalfileresource_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY externalfileresource
    ADD CONSTRAINT externalfileresource_pkey PRIMARY KEY (externalfileresourceid);


--
-- Name: externalmaplayer_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY externalmaplayer
    ADD CONSTRAINT externalmaplayer_pkey PRIMARY KEY (externalmaplayerid);


--
-- Name: externalmaplayerusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY externalmaplayerusergroupaccesses
    ADD CONSTRAINT externalmaplayerusergroupaccesses_pkey PRIMARY KEY (externalmaplayerid, usergroupaccessid);


--
-- Name: fileresource_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY fileresource
    ADD CONSTRAINT fileresource_pkey PRIMARY KEY (fileresourceid);


--
-- Name: i18nlocale_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY i18nlocale
    ADD CONSTRAINT i18nlocale_pkey PRIMARY KEY (i18nlocaleid);


--
-- Name: incomingsms_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY incomingsms
    ADD CONSTRAINT incomingsms_pkey PRIMARY KEY (id);


--
-- Name: indicator_code_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicator
    ADD CONSTRAINT indicator_code_key UNIQUE (code);


--
-- Name: indicator_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicator
    ADD CONSTRAINT indicator_pkey PRIMARY KEY (indicatorid);


--
-- Name: indicatorattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorattributevalues
    ADD CONSTRAINT indicatorattributevalues_pkey PRIMARY KEY (indicatorid, attributevalueid);


--
-- Name: indicatorgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroup
    ADD CONSTRAINT indicatorgroup_pkey PRIMARY KEY (indicatorgroupid);


--
-- Name: indicatorgroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupattributevalues
    ADD CONSTRAINT indicatorgroupattributevalues_pkey PRIMARY KEY (indicatorgroupid, attributevalueid);


--
-- Name: indicatorgroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupmembers
    ADD CONSTRAINT indicatorgroupmembers_pkey PRIMARY KEY (indicatorgroupid, indicatorid);


--
-- Name: indicatorgroupset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupset
    ADD CONSTRAINT indicatorgroupset_pkey PRIMARY KEY (indicatorgroupsetid);


--
-- Name: indicatorgroupsetmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupsetmembers
    ADD CONSTRAINT indicatorgroupsetmembers_pkey PRIMARY KEY (indicatorgroupsetid, sort_order);


--
-- Name: indicatorgroupsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupsettranslations
    ADD CONSTRAINT indicatorgroupsettranslations_pkey PRIMARY KEY (indicatorgroupsetid, objecttranslationid);


--
-- Name: indicatorgroupsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupsetusergroupaccesses
    ADD CONSTRAINT indicatorgroupsetusergroupaccesses_pkey PRIMARY KEY (indicatorgroupsetid, usergroupaccessid);


--
-- Name: indicatorgrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgrouptranslations
    ADD CONSTRAINT indicatorgrouptranslations_pkey PRIMARY KEY (indicatorgroupid, objecttranslationid);


--
-- Name: indicatorgroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupusergroupaccesses
    ADD CONSTRAINT indicatorgroupusergroupaccesses_pkey PRIMARY KEY (indicatorgroupid, usergroupaccessid);


--
-- Name: indicatortranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatortranslations
    ADD CONSTRAINT indicatortranslations_pkey PRIMARY KEY (indicatorid, objecttranslationid);


--
-- Name: indicatortype_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatortype
    ADD CONSTRAINT indicatortype_pkey PRIMARY KEY (indicatortypeid);


--
-- Name: indicatortypetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatortypetranslations
    ADD CONSTRAINT indicatortypetranslations_pkey PRIMARY KEY (indicatortypeid, objecttranslationid);


--
-- Name: indicatorusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorusergroupaccesses
    ADD CONSTRAINT indicatorusergroupaccesses_pkey PRIMARY KEY (indicatorid, usergroupaccessid);


--
-- Name: intepretation_likedby_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY intepretation_likedby
    ADD CONSTRAINT intepretation_likedby_pkey PRIMARY KEY (interpretationid, userid);


--
-- Name: interpretation_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY interpretation_comments
    ADD CONSTRAINT interpretation_comments_pkey PRIMARY KEY (interpretationid, sort_order);


--
-- Name: interpretation_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT interpretation_pkey PRIMARY KEY (interpretationid);


--
-- Name: interpretationcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY interpretationcomment
    ADD CONSTRAINT interpretationcomment_pkey PRIMARY KEY (interpretationcommentid);


--
-- Name: interpretationusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY interpretationusergroupaccesses
    ADD CONSTRAINT interpretationusergroupaccesses_pkey PRIMARY KEY (interpretationid, usergroupaccessid);


--
-- Name: jphes_agencyunit_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_agencyunit
    ADD CONSTRAINT jphes_agencyunit_pkey PRIMARY KEY (agencyunitid);


--
-- Name: jphes_agencyunitmechanismunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_agencyunitmechanismunits
    ADD CONSTRAINT jphes_agencyunitmechanismunits_pkey PRIMARY KEY (agencyunitid, mechanismunitid);


--
-- Name: jphes_agencyunitprograms_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_agencyunitprograms
    ADD CONSTRAINT jphes_agencyunitprograms_pkey PRIMARY KEY (agencyunitid, programid);


--
-- Name: jphes_donorunit_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_donorunit
    ADD CONSTRAINT jphes_donorunit_pkey PRIMARY KEY (donorunitid);


--
-- Name: jphes_donorunitagencyunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_donorunitagencyunits
    ADD CONSTRAINT jphes_donorunitagencyunits_pkey PRIMARY KEY (donorunitid, agencyunitid);


--
-- Name: jphes_donorunitprograms_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_donorunitprograms
    ADD CONSTRAINT jphes_donorunitprograms_pkey PRIMARY KEY (donorunitid, programid);


--
-- Name: jphes_mechanismunit_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_mechanismunit
    ADD CONSTRAINT jphes_mechanismunit_pkey PRIMARY KEY (mechanismunitid);


--
-- Name: jphes_mechanismunitprograms_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_mechanismunitprograms
    ADD CONSTRAINT jphes_mechanismunitprograms_pkey PRIMARY KEY (mechanismunitid, programid);


--
-- Name: jphes_nationalunit_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_nationalunit
    ADD CONSTRAINT jphes_nationalunit_pkey PRIMARY KEY (nationalunitid);


--
-- Name: jphes_nationalunitdonorunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_nationalunitdonorunits
    ADD CONSTRAINT jphes_nationalunitdonorunits_pkey PRIMARY KEY (nationalunitid, donorunitid);


--
-- Name: jphes_nationalunitprograms_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_nationalunitprograms
    ADD CONSTRAINT jphes_nationalunitprograms_pkey PRIMARY KEY (nationalunitid, programid);


--
-- Name: jphes_program_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_program
    ADD CONSTRAINT jphes_program_pkey PRIMARY KEY (programid);


--
-- Name: jphes_programdataelements_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_programdataelements
    ADD CONSTRAINT jphes_programdataelements_pkey PRIMARY KEY (programid, dataelementid);


--
-- Name: jphes_programindicators_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_programindicators
    ADD CONSTRAINT jphes_programindicators_pkey PRIMARY KEY (programid, indicatorid);


--
-- Name: key_sectionnamedataset; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY section
    ADD CONSTRAINT key_sectionnamedataset UNIQUE (name, datasetid);


--
-- Name: keyjsonvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY keyjsonvalue
    ADD CONSTRAINT keyjsonvalue_pkey PRIMARY KEY (keyjsonvalueid);


--
-- Name: keyjsonvalue_unique_key_in_namespace; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY keyjsonvalue
    ADD CONSTRAINT keyjsonvalue_unique_key_in_namespace UNIQUE (namespace, namespacekey);


--
-- Name: legendsetattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY legendsetattributevalues
    ADD CONSTRAINT legendsetattributevalues_pkey PRIMARY KEY (legendsetid, attributevalueid);


--
-- Name: legendsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY legendsetusergroupaccesses
    ADD CONSTRAINT legendsetusergroupaccesses_pkey PRIMARY KEY (maplegendsetid, usergroupaccessid);


--
-- Name: lockexception_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY lockexception
    ADD CONSTRAINT lockexception_pkey PRIMARY KEY (lockexceptionid);


--
-- Name: map_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY map
    ADD CONSTRAINT map_pkey PRIMARY KEY (mapid);


--
-- Name: maplegend_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY maplegend
    ADD CONSTRAINT maplegend_pkey PRIMARY KEY (maplegendid);


--
-- Name: maplegendset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY maplegendset
    ADD CONSTRAINT maplegendset_pkey PRIMARY KEY (maplegendsetid);


--
-- Name: maplegendsetmaplegend_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY maplegendsetmaplegend
    ADD CONSTRAINT maplegendsetmaplegend_pkey PRIMARY KEY (legendsetid, maplegendid);


--
-- Name: maplegendsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY maplegendsettranslations
    ADD CONSTRAINT maplegendsettranslations_pkey PRIMARY KEY (maplegendsetid, objecttranslationid);


--
-- Name: maplegendtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY maplegendtranslations
    ADD CONSTRAINT maplegendtranslations_pkey PRIMARY KEY (maplegendid, objecttranslationid);


--
-- Name: mapmapviews_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapmapviews
    ADD CONSTRAINT mapmapviews_pkey PRIMARY KEY (mapid, sort_order);


--
-- Name: mapusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapusergroupaccesses
    ADD CONSTRAINT mapusergroupaccesses_pkey PRIMARY KEY (mapid, usergroupaccessid);


--
-- Name: mapview_attributedimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_attributedimensions
    ADD CONSTRAINT mapview_attributedimensions_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_columns
    ADD CONSTRAINT mapview_columns_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_datadimensionitems_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_datadimensionitems
    ADD CONSTRAINT mapview_datadimensionitems_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_dataelementdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_dataelementdimensions
    ADD CONSTRAINT mapview_dataelementdimensions_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_itemorgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_itemorgunitgroups
    ADD CONSTRAINT mapview_itemorgunitgroups_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_organisationunits
    ADD CONSTRAINT mapview_organisationunits_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_orgunitlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_orgunitlevels
    ADD CONSTRAINT mapview_orgunitlevels_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_periods
    ADD CONSTRAINT mapview_periods_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview
    ADD CONSTRAINT mapview_pkey PRIMARY KEY (mapviewid);


--
-- Name: mapviewtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapviewtranslations
    ADD CONSTRAINT mapviewtranslations_pkey PRIMARY KEY (mapviewid, objecttranslationid);


--
-- Name: mechanismunitusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mechanismunitusergroupaccesses
    ADD CONSTRAINT mechanismunitusergroupaccesses_pkey PRIMARY KEY (mechanismunitid, usergroupaccessid);


--
-- Name: message_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY message
    ADD CONSTRAINT message_pkey PRIMARY KEY (messageid);


--
-- Name: messageconversation_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY messageconversation_messages
    ADD CONSTRAINT messageconversation_messages_pkey PRIMARY KEY (messageconversationid, sort_order);


--
-- Name: messageconversation_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY messageconversation
    ADD CONSTRAINT messageconversation_pkey PRIMARY KEY (messageconversationid);


--
-- Name: messageconversation_usermessages_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY messageconversation_usermessages
    ADD CONSTRAINT messageconversation_usermessages_pkey PRIMARY KEY (messageconversationid, usermessageid);


--
-- Name: metadataversion_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY metadataversion
    ADD CONSTRAINT metadataversion_pkey PRIMARY KEY (versionid);


--
-- Name: minmaxdataelement_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY minmaxdataelement
    ADD CONSTRAINT minmaxdataelement_pkey PRIMARY KEY (minmaxdataelementid);


--
-- Name: nationalunitusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY nationalunitusergroupaccesses
    ADD CONSTRAINT nationalunitusergroupaccesses_pkey PRIMARY KEY (nationalunitid, usergroupaccessid);


--
-- Name: oauth2client_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY oauth2client
    ADD CONSTRAINT oauth2client_pkey PRIMARY KEY (oauth2clientid);


--
-- Name: oauth2clientgranttypes_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY oauth2clientgranttypes
    ADD CONSTRAINT oauth2clientgranttypes_pkey PRIMARY KEY (oauth2clientid, sort_order);


--
-- Name: oauth2clientredirecturis_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY oauth2clientredirecturis
    ADD CONSTRAINT oauth2clientredirecturis_pkey PRIMARY KEY (oauth2clientid, sort_order);


--
-- Name: oauth_access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY oauth_access_token
    ADD CONSTRAINT oauth_access_token_pkey PRIMARY KEY (authentication_id);


--
-- Name: objecttranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY objecttranslation
    ADD CONSTRAINT objecttranslation_pkey PRIMARY KEY (objecttranslationid);


--
-- Name: optionattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionattributevalues
    ADD CONSTRAINT optionattributevalues_pkey PRIMARY KEY (optionvalueid, attributevalueid);


--
-- Name: optiongroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroup
    ADD CONSTRAINT optiongroup_pkey PRIMARY KEY (optiongroupid);


--
-- Name: optiongroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupattributevalues
    ADD CONSTRAINT optiongroupattributevalues_pkey PRIMARY KEY (optiongroupid, attributevalueid);


--
-- Name: optiongroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupmembers
    ADD CONSTRAINT optiongroupmembers_pkey PRIMARY KEY (optiongroupid, optionid);


--
-- Name: optiongroupset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupset
    ADD CONSTRAINT optiongroupset_pkey PRIMARY KEY (optiongroupsetid);


--
-- Name: optiongroupsetmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupsetmembers
    ADD CONSTRAINT optiongroupsetmembers_pkey PRIMARY KEY (optiongroupsetid, sort_order);


--
-- Name: optiongroupsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupsettranslations
    ADD CONSTRAINT optiongroupsettranslations_pkey PRIMARY KEY (optiongroupsetid, objecttranslationid);


--
-- Name: optiongroupsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupsetusergroupaccesses
    ADD CONSTRAINT optiongroupsetusergroupaccesses_pkey PRIMARY KEY (optiongroupsetid, usergroupaccessid);


--
-- Name: optiongrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongrouptranslations
    ADD CONSTRAINT optiongrouptranslations_pkey PRIMARY KEY (optiongroupid, objecttranslationid);


--
-- Name: optiongroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupusergroupaccesses
    ADD CONSTRAINT optiongroupusergroupaccesses_pkey PRIMARY KEY (optiongroupid, usergroupaccessid);


--
-- Name: optionset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionset
    ADD CONSTRAINT optionset_pkey PRIMARY KEY (optionsetid);


--
-- Name: optionsetattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionsetattributevalues
    ADD CONSTRAINT optionsetattributevalues_pkey PRIMARY KEY (optionsetid, attributevalueid);


--
-- Name: optionsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionsettranslations
    ADD CONSTRAINT optionsettranslations_pkey PRIMARY KEY (optionsetid, objecttranslationid);


--
-- Name: optionsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionsetusergroupaccesses
    ADD CONSTRAINT optionsetusergroupaccesses_pkey PRIMARY KEY (optionsetid, usergroupaccessid);


--
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (optionvalueid);


--
-- Name: optionvaluetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionvaluetranslations
    ADD CONSTRAINT optionvaluetranslations_pkey PRIMARY KEY (optionvalueid, objecttranslationid);


--
-- Name: organisationunit_code_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY organisationunit
    ADD CONSTRAINT organisationunit_code_key UNIQUE (code);


--
-- Name: organisationunit_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY organisationunit
    ADD CONSTRAINT organisationunit_pkey PRIMARY KEY (organisationunitid);


--
-- Name: organisationunitattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY organisationunitattributevalues
    ADD CONSTRAINT organisationunitattributevalues_pkey PRIMARY KEY (organisationunitid, attributevalueid);


--
-- Name: organisationunittranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY organisationunittranslations
    ADD CONSTRAINT organisationunittranslations_pkey PRIMARY KEY (organisationunitid, objecttranslationid);


--
-- Name: orgunitgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroup
    ADD CONSTRAINT orgunitgroup_name_key UNIQUE (name);


--
-- Name: orgunitgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroup
    ADD CONSTRAINT orgunitgroup_pkey PRIMARY KEY (orgunitgroupid);


--
-- Name: orgunitgroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupattributevalues
    ADD CONSTRAINT orgunitgroupattributevalues_pkey PRIMARY KEY (orgunitgroupid, attributevalueid);


--
-- Name: orgunitgroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupmembers
    ADD CONSTRAINT orgunitgroupmembers_pkey PRIMARY KEY (orgunitgroupid, organisationunitid);


--
-- Name: orgunitgroupset_name_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupset
    ADD CONSTRAINT orgunitgroupset_name_key UNIQUE (name);


--
-- Name: orgunitgroupset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupset
    ADD CONSTRAINT orgunitgroupset_pkey PRIMARY KEY (orgunitgroupsetid);


--
-- Name: orgunitgroupsetattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupsetattributevalues
    ADD CONSTRAINT orgunitgroupsetattributevalues_pkey PRIMARY KEY (orgunitgroupsetid, attributevalueid);


--
-- Name: orgunitgroupsetmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupsetmembers
    ADD CONSTRAINT orgunitgroupsetmembers_pkey PRIMARY KEY (orgunitgroupsetid, orgunitgroupid);


--
-- Name: orgunitgroupsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupsettranslations
    ADD CONSTRAINT orgunitgroupsettranslations_pkey PRIMARY KEY (orgunitgroupsetid, objecttranslationid);


--
-- Name: orgunitgroupsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupsetusergroupaccesses
    ADD CONSTRAINT orgunitgroupsetusergroupaccesses_pkey PRIMARY KEY (orgunitgroupsetid, usergroupaccessid);


--
-- Name: orgunitgrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgrouptranslations
    ADD CONSTRAINT orgunitgrouptranslations_pkey PRIMARY KEY (orgunitgroupid, objecttranslationid);


--
-- Name: orgunitgroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupusergroupaccesses
    ADD CONSTRAINT orgunitgroupusergroupaccesses_pkey PRIMARY KEY (orgunitgroupid, usergroupaccessid);


--
-- Name: orgunitlevel_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitlevel
    ADD CONSTRAINT orgunitlevel_pkey PRIMARY KEY (orgunitlevelid);


--
-- Name: orgunitleveltranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitleveltranslations
    ADD CONSTRAINT orgunitleveltranslations_pkey PRIMARY KEY (orgunitlevelid, objecttranslationid);


--
-- Name: outbound_sms_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY outbound_sms
    ADD CONSTRAINT outbound_sms_pkey PRIMARY KEY (id);


--
-- Name: period_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY period
    ADD CONSTRAINT period_pkey PRIMARY KEY (periodid);


--
-- Name: periodtype_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY periodtype
    ADD CONSTRAINT periodtype_pkey PRIMARY KEY (periodtypeid);


--
-- Name: predictor_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY predictor
    ADD CONSTRAINT predictor_pkey PRIMARY KEY (predictorid);


--
-- Name: predictororgunitlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY predictororgunitlevels
    ADD CONSTRAINT predictororgunitlevels_pkey PRIMARY KEY (predictorid, orgunitlevelid);


--
-- Name: program_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program_attributes
    ADD CONSTRAINT program_attributes_pkey PRIMARY KEY (programtrackedentityattributeid);


--
-- Name: program_criteria_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program_criteria
    ADD CONSTRAINT program_criteria_pkey PRIMARY KEY (programid, validationcriteriaid);


--
-- Name: program_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program_organisationunits
    ADD CONSTRAINT program_organisationunits_pkey PRIMARY KEY (programid, organisationunitid);


--
-- Name: program_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program
    ADD CONSTRAINT program_pkey PRIMARY KEY (programid);


--
-- Name: program_userroles_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program_userroles
    ADD CONSTRAINT program_userroles_pkey PRIMARY KEY (userroleid, programid);


--
-- Name: programattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programattributevalues
    ADD CONSTRAINT programattributevalues_pkey PRIMARY KEY (programid, attributevalueid);


--
-- Name: programdataelement_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programdataelement
    ADD CONSTRAINT programdataelement_pkey PRIMARY KEY (programdataelementid);


--
-- Name: programdataelement_unique_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programdataelement
    ADD CONSTRAINT programdataelement_unique_key UNIQUE (programid, dataelementid);


--
-- Name: programdataelementtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programdataelementtranslations
    ADD CONSTRAINT programdataelementtranslations_pkey PRIMARY KEY (programdataelementid, objecttranslationid);


--
-- Name: programexpression_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programexpression
    ADD CONSTRAINT programexpression_pkey PRIMARY KEY (programexpressionid);


--
-- Name: programindicator_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicator
    ADD CONSTRAINT programindicator_pkey PRIMARY KEY (programindicatorid);


--
-- Name: programindicatorattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorattributevalues
    ADD CONSTRAINT programindicatorattributevalues_pkey PRIMARY KEY (programindicatorid, attributevalueid);


--
-- Name: programindicatorgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorgroup
    ADD CONSTRAINT programindicatorgroup_pkey PRIMARY KEY (programindicatorgroupid);


--
-- Name: programindicatorgroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorgroupattributevalues
    ADD CONSTRAINT programindicatorgroupattributevalues_pkey PRIMARY KEY (programindicatorgroupid, attributevalueid);


--
-- Name: programindicatorgroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorgroupmembers
    ADD CONSTRAINT programindicatorgroupmembers_pkey PRIMARY KEY (programindicatorgroupid, programindicatorid);


--
-- Name: programindicatorgrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorgrouptranslations
    ADD CONSTRAINT programindicatorgrouptranslations_pkey PRIMARY KEY (programindicatorgroupid, objecttranslationid);


--
-- Name: programindicatorgroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorgroupusergroupaccesses
    ADD CONSTRAINT programindicatorgroupusergroupaccesses_pkey PRIMARY KEY (programindicatorgroupid, usergroupaccessid);


--
-- Name: programindicatortranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatortranslations
    ADD CONSTRAINT programindicatortranslations_pkey PRIMARY KEY (programindicatorid, objecttranslationid);


--
-- Name: programindicatorusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorusergroupaccesses
    ADD CONSTRAINT programindicatorusergroupaccesses_pkey PRIMARY KEY (programindicatorid, usergroupaccessid);


--
-- Name: programinstance_messageconversation_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programinstance_messageconversation
    ADD CONSTRAINT programinstance_messageconversation_pkey PRIMARY KEY (programinstanceid, sort_order);


--
-- Name: programinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programinstance
    ADD CONSTRAINT programinstance_pkey PRIMARY KEY (programinstanceid);


--
-- Name: programinstancecomments_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programinstancecomments
    ADD CONSTRAINT programinstancecomments_pkey PRIMARY KEY (programinstanceid, sort_order);


--
-- Name: programmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programmessage
    ADD CONSTRAINT programmessage_pkey PRIMARY KEY (id);


--
-- Name: programmessagetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programmessagetranslations
    ADD CONSTRAINT programmessagetranslations_pkey PRIMARY KEY (id, objecttranslationid);


--
-- Name: programnotificationtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programnotificationtemplate
    ADD CONSTRAINT programnotificationtemplate_pkey PRIMARY KEY (programnotificationtemplateid);


--
-- Name: programrule_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programrule
    ADD CONSTRAINT programrule_pkey PRIMARY KEY (programruleid);


--
-- Name: programruleaction_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programruleaction
    ADD CONSTRAINT programruleaction_pkey PRIMARY KEY (programruleactionid);


--
-- Name: programruletranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programruletranslations
    ADD CONSTRAINT programruletranslations_pkey PRIMARY KEY (programruleid, objecttranslationid);


--
-- Name: programrulevariable_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programrulevariable
    ADD CONSTRAINT programrulevariable_pkey PRIMARY KEY (programrulevariableid);


--
-- Name: programstage_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstage
    ADD CONSTRAINT programstage_pkey PRIMARY KEY (programstageid);


--
-- Name: programstageattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstageattributevalues
    ADD CONSTRAINT programstageattributevalues_pkey PRIMARY KEY (programstageid, attributevalueid);


--
-- Name: programstagedataelement_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagedataelement
    ADD CONSTRAINT programstagedataelement_pkey PRIMARY KEY (programstagedataelementid);


--
-- Name: programstagedataelement_unique_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagedataelement
    ADD CONSTRAINT programstagedataelement_unique_key UNIQUE (programstageid, dataelementid);


--
-- Name: programstageinstance_messageconversation_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstageinstance_messageconversation
    ADD CONSTRAINT programstageinstance_messageconversation_pkey PRIMARY KEY (programstageinstanceid, sort_order);


--
-- Name: programstageinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstageinstance
    ADD CONSTRAINT programstageinstance_pkey PRIMARY KEY (programstageinstanceid);


--
-- Name: programstageinstancecomments_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstageinstancecomments
    ADD CONSTRAINT programstageinstancecomments_pkey PRIMARY KEY (programstageinstanceid, sort_order);


--
-- Name: programstagesection_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagesection
    ADD CONSTRAINT programstagesection_pkey PRIMARY KEY (programstagesectionid);


--
-- Name: programstagesection_programindicators_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagesection_programindicators
    ADD CONSTRAINT programstagesection_programindicators_pkey PRIMARY KEY (programstagesectionid, sort_order);


--
-- Name: programstagesectiontranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagesectiontranslations
    ADD CONSTRAINT programstagesectiontranslations_pkey PRIMARY KEY (programstagesectionid, objecttranslationid);


--
-- Name: programstagetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagetranslations
    ADD CONSTRAINT programstagetranslations_pkey PRIMARY KEY (programstageid, objecttranslationid);


--
-- Name: programtrackedentityattribute_unique_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program_attributes
    ADD CONSTRAINT programtrackedentityattribute_unique_key UNIQUE (programid, trackedentityattributeid);


--
-- Name: programtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programtranslations
    ADD CONSTRAINT programtranslations_pkey PRIMARY KEY (programid, objecttranslationid);


--
-- Name: programusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programusergroupaccesses
    ADD CONSTRAINT programusergroupaccesses_pkey PRIMARY KEY (programid, usergroupaccessid);


--
-- Name: programvalidation_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programvalidation
    ADD CONSTRAINT programvalidation_pkey PRIMARY KEY (programvalidationid);


--
-- Name: programvalidationtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programvalidationtranslations
    ADD CONSTRAINT programvalidationtranslations_pkey PRIMARY KEY (programvalidationid, objecttranslationid);


--
-- Name: pushanalysis_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY pushanalysis
    ADD CONSTRAINT pushanalysis_pkey PRIMARY KEY (pushanalysisid);


--
-- Name: pushanalysisrecipientusergroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY pushanalysisrecipientusergroups
    ADD CONSTRAINT pushanalysisrecipientusergroups_pkey PRIMARY KEY (usergroupid, elt);


--
-- Name: relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY relationship
    ADD CONSTRAINT relationship_pkey PRIMARY KEY (relationshipid);


--
-- Name: relationshiptype_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY relationshiptype
    ADD CONSTRAINT relationshiptype_pkey PRIMARY KEY (relationshiptypeid);


--
-- Name: relationshiptypetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY relationshiptypetranslations
    ADD CONSTRAINT relationshiptypetranslations_pkey PRIMARY KEY (relationshiptypeid, objecttranslationid);


--
-- Name: relativeperiods_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY relativeperiods
    ADD CONSTRAINT relativeperiods_pkey PRIMARY KEY (relativeperiodsid);


--
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (reportid);


--
-- Name: reporttable_categorydimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_categorydimensions
    ADD CONSTRAINT reporttable_categorydimensions_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_categoryoptiongroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_categoryoptiongroups
    ADD CONSTRAINT reporttable_categoryoptiongroups_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_columns
    ADD CONSTRAINT reporttable_columns_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_datadimensionitems_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_datadimensionitems
    ADD CONSTRAINT reporttable_datadimensionitems_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_dataelementgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_dataelementgroups
    ADD CONSTRAINT reporttable_dataelementgroups_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_filters
    ADD CONSTRAINT reporttable_filters_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_itemorgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_itemorgunitgroups
    ADD CONSTRAINT reporttable_itemorgunitgroups_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_organisationunits
    ADD CONSTRAINT reporttable_organisationunits_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_orgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_orgunitgroups
    ADD CONSTRAINT reporttable_orgunitgroups_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_orgunitlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_orgunitlevels
    ADD CONSTRAINT reporttable_orgunitlevels_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_periods
    ADD CONSTRAINT reporttable_periods_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable
    ADD CONSTRAINT reporttable_pkey PRIMARY KEY (reporttableid);


--
-- Name: reporttable_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_rows
    ADD CONSTRAINT reporttable_rows_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttabletranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttabletranslations
    ADD CONSTRAINT reporttabletranslations_pkey PRIMARY KEY (reporttableid, objecttranslationid);


--
-- Name: reporttableusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttableusergroupaccesses
    ADD CONSTRAINT reporttableusergroupaccesses_pkey PRIMARY KEY (reporttableid, usergroupaccessid);


--
-- Name: reporttranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttranslations
    ADD CONSTRAINT reporttranslations_pkey PRIMARY KEY (reportid, objecttranslationid);


--
-- Name: reportusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reportusergroupaccesses
    ADD CONSTRAINT reportusergroupaccesses_pkey PRIMARY KEY (reportid, usergroupaccessid);


--
-- Name: section_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY section
    ADD CONSTRAINT section_pkey PRIMARY KEY (sectionid);


--
-- Name: sectionattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sectionattributevalues
    ADD CONSTRAINT sectionattributevalues_pkey PRIMARY KEY (sectionid, attributevalueid);


--
-- Name: sectiondataelements_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sectiondataelements
    ADD CONSTRAINT sectiondataelements_pkey PRIMARY KEY (sectionid, sort_order);


--
-- Name: sectiongreyedfields_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sectiongreyedfields
    ADD CONSTRAINT sectiongreyedfields_pkey PRIMARY KEY (sectionid, dataelementoperandid);


--
-- Name: sectionindicators_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sectionindicators
    ADD CONSTRAINT sectionindicators_pkey PRIMARY KEY (sectionid, sort_order);


--
-- Name: smscodes_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY smscodes
    ADD CONSTRAINT smscodes_pkey PRIMARY KEY (smscodeid);


--
-- Name: smscommandcodes_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY smscommandcodes
    ADD CONSTRAINT smscommandcodes_pkey PRIMARY KEY (id, codeid);


--
-- Name: smscommands_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY smscommands
    ADD CONSTRAINT smscommands_pkey PRIMARY KEY (smscommandid);


--
-- Name: smscommandspecialcharacters_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY smscommandspecialcharacters
    ADD CONSTRAINT smscommandspecialcharacters_pkey PRIMARY KEY (smscommandid, specialcharacterid);


--
-- Name: smsspecialcharacter_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY smsspecialcharacter
    ADD CONSTRAINT smsspecialcharacter_pkey PRIMARY KEY (specialcharacterid);


--
-- Name: sqlview_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sqlview
    ADD CONSTRAINT sqlview_pkey PRIMARY KEY (sqlviewid);


--
-- Name: sqlviewattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sqlviewattributevalues
    ADD CONSTRAINT sqlviewattributevalues_pkey PRIMARY KEY (sqlviewid, attributevalueid);


--
-- Name: sqlviewusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sqlviewusergroupaccesses
    ADD CONSTRAINT sqlviewusergroupaccesses_pkey PRIMARY KEY (sqlviewid, usergroupaccessid);


--
-- Name: systemsetting_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY systemsetting
    ADD CONSTRAINT systemsetting_pkey PRIMARY KEY (systemsettingid);


--
-- Name: trackedentity_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentity
    ADD CONSTRAINT trackedentity_pkey PRIMARY KEY (trackedentityid);


--
-- Name: trackedentityattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT trackedentityattribute_pkey PRIMARY KEY (trackedentityattributeid);


--
-- Name: trackedentityattributeattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributeattributevalues
    ADD CONSTRAINT trackedentityattributeattributevalues_pkey PRIMARY KEY (trackedentityattributeid, attributevalueid);


--
-- Name: trackedentityattributedimension_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributedimension
    ADD CONSTRAINT trackedentityattributedimension_pkey PRIMARY KEY (trackedentityattributedimensionid);


--
-- Name: trackedentityattributegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributegroup
    ADD CONSTRAINT trackedentityattributegroup_pkey PRIMARY KEY (trackedentityattributegroupid);


--
-- Name: trackedentityattributegrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributegrouptranslations
    ADD CONSTRAINT trackedentityattributegrouptranslations_pkey PRIMARY KEY (trackedentityattributegroupid, objecttranslationid);


--
-- Name: trackedentityattributereservedvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributereservedvalue
    ADD CONSTRAINT trackedentityattributereservedvalue_pkey PRIMARY KEY (trackedentityattributereservedvalueid);


--
-- Name: trackedentityattributetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributetranslations
    ADD CONSTRAINT trackedentityattributetranslations_pkey PRIMARY KEY (trackedentityattributeid, objecttranslationid);


--
-- Name: trackedentityattributeusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributeusergroupaccesses
    ADD CONSTRAINT trackedentityattributeusergroupaccesses_pkey PRIMARY KEY (trackedentityattributeid, usergroupaccessid);


--
-- Name: trackedentityattributevalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributevalue
    ADD CONSTRAINT trackedentityattributevalue_pkey PRIMARY KEY (trackedentityinstanceid, trackedentityattributeid);


--
-- Name: trackedentityattributevalueaudit_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributevalueaudit
    ADD CONSTRAINT trackedentityattributevalueaudit_pkey PRIMARY KEY (trackedentityattributevalueauditid);


--
-- Name: trackedentityattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributevalues
    ADD CONSTRAINT trackedentityattributevalues_pkey PRIMARY KEY (trackedentityid, attributevalueid);


--
-- Name: trackedentitycomment_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentitycomment
    ADD CONSTRAINT trackedentitycomment_pkey PRIMARY KEY (trackedentitycommentid);


--
-- Name: trackedentitydataelementdimension_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentitydataelementdimension
    ADD CONSTRAINT trackedentitydataelementdimension_pkey PRIMARY KEY (trackedentitydataelementdimensionid);


--
-- Name: trackedentitydatavalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentitydatavalue
    ADD CONSTRAINT trackedentitydatavalue_pkey PRIMARY KEY (programstageinstanceid, dataelementid);


--
-- Name: trackedentitydatavalueaudit_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentitydatavalueaudit
    ADD CONSTRAINT trackedentitydatavalueaudit_pkey PRIMARY KEY (trackedentitydatavalueauditid);


--
-- Name: trackedentityinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityinstance
    ADD CONSTRAINT trackedentityinstance_pkey PRIMARY KEY (trackedentityinstanceid);


--
-- Name: trackedentityprogramindicatordimension_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityprogramindicatordimension
    ADD CONSTRAINT trackedentityprogramindicatordimension_pkey PRIMARY KEY (trackedentityprogramindicatordimensionid);


--
-- Name: trackedentitytranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentitytranslations
    ADD CONSTRAINT trackedentitytranslations_pkey PRIMARY KEY (trackedentityid, objecttranslationid);


--
-- Name: uk_13x63e3skbl5qj4mc1qgq2xex; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrule
    ADD CONSTRAINT uk_13x63e3skbl5qj4mc1qgq2xex UNIQUE (code);


--
-- Name: uk_1774shfid1uaopl9tu8am19fq; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY attribute
    ADD CONSTRAINT uk_1774shfid1uaopl9tu8am19fq UNIQUE (code);


--
-- Name: uk_18b68rcofdwt1sbr6rf55poog; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT uk_18b68rcofdwt1sbr6rf55poog UNIQUE (uid);


--
-- Name: uk_1dw8gju4leg7iud4gpsr5r1ng; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview
    ADD CONSTRAINT uk_1dw8gju4leg7iud4gpsr5r1ng UNIQUE (uid);


--
-- Name: uk_1ev6xqtcsfr4wv6rel0lkg44n; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategory
    ADD CONSTRAINT uk_1ev6xqtcsfr4wv6rel0lkg44n UNIQUE (uid);


--
-- Name: uk_1ie06vhy3begtwuuvrv0f71se; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY report
    ADD CONSTRAINT uk_1ie06vhy3begtwuuvrv0f71se UNIQUE (uid);


--
-- Name: uk_1lvk8ftq028jrr28qouou9q3c; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrulegroup
    ADD CONSTRAINT uk_1lvk8ftq028jrr28qouou9q3c UNIQUE (code);


--
-- Name: uk_1qlw3rts2pog96ye7r6fqd122; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programmessage
    ADD CONSTRAINT uk_1qlw3rts2pog96ye7r6fqd122 UNIQUE (uid);


--
-- Name: uk_1sp445tglu49hyfwokjqn5bf6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart
    ADD CONSTRAINT uk_1sp445tglu49hyfwokjqn5bf6 UNIQUE (uid);


--
-- Name: uk_1tcaydw2p91wi8ib0qqa1jcfs; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program
    ADD CONSTRAINT uk_1tcaydw2p91wi8ib0qqa1jcfs UNIQUE (shortname);


--
-- Name: uk_1ueqf4w12q93b1fmie19j3591; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_agencyunit
    ADD CONSTRAINT uk_1ueqf4w12q93b1fmie19j3591 UNIQUE (uid);


--
-- Name: uk_1xk8j7j0a3li8o0ukblanosky; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupset
    ADD CONSTRAINT uk_1xk8j7j0a3li8o0ukblanosky UNIQUE (name);


--
-- Name: uk_22wt9yk9idujmywno44v9qf66; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagesection
    ADD CONSTRAINT uk_22wt9yk9idujmywno44v9qf66 UNIQUE (code);


--
-- Name: uk_2boebaetgus89t1k8nn4dac65; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupset
    ADD CONSTRAINT uk_2boebaetgus89t1k8nn4dac65 UNIQUE (uid);


--
-- Name: uk_2ejl9l5vm4rhtqj8eit31g0u6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagedataelement
    ADD CONSTRAINT uk_2ejl9l5vm4rhtqj8eit31g0u6 UNIQUE (code);


--
-- Name: uk_2l0ovv74pjtairmeyiwy4i2ui; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY i18nlocale
    ADD CONSTRAINT uk_2l0ovv74pjtairmeyiwy4i2ui UNIQUE (uid);


--
-- Name: uk_2nhc265rlfu3dlc3qouvjdprl; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT uk_2nhc265rlfu3dlc3qouvjdprl UNIQUE (name);


--
-- Name: uk_2p9x16ryxtek0g6bqwd49et0c; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorgroup
    ADD CONSTRAINT uk_2p9x16ryxtek0g6bqwd49et0c UNIQUE (uid);


--
-- Name: uk_2pimmculf9ttu2dxquomb9ram; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programnotificationtemplate
    ADD CONSTRAINT uk_2pimmculf9ttu2dxquomb9ram UNIQUE (uid);


--
-- Name: uk_2r18tvmbtksk69j35uxpwej44; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovallevel
    ADD CONSTRAINT uk_2r18tvmbtksk69j35uxpwej44 UNIQUE (code);


--
-- Name: uk_2txykr764xpcrls7jinp65j9b; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_nationalunit
    ADD CONSTRAINT uk_2txykr764xpcrls7jinp65j9b UNIQUE (shortname);


--
-- Name: uk_2ubxwwtgyqd0h2mvy46u3prfq; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userkeyjsonvalue
    ADD CONSTRAINT uk_2ubxwwtgyqd0h2mvy46u3prfq UNIQUE (code);


--
-- Name: uk_37l2m3o1xfuagpki90gfh5kqb; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY map
    ADD CONSTRAINT uk_37l2m3o1xfuagpki90gfh5kqb UNIQUE (code);


--
-- Name: uk_3a4ee92kxafw85hsopq4qle47; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorycombo
    ADD CONSTRAINT uk_3a4ee92kxafw85hsopq4qle47 UNIQUE (code);


--
-- Name: uk_3c2n8db21er764e4skh3qg57w; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programruleaction
    ADD CONSTRAINT uk_3c2n8db21er764e4skh3qg57w UNIQUE (uid);


--
-- Name: uk_3cl2o6ha8naw5w6my3q4el6gk; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrulegroup
    ADD CONSTRAINT uk_3cl2o6ha8naw5w6my3q4el6gk UNIQUE (name);


--
-- Name: uk_3idqsvkpmxpehxqv615s952vd; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditem
    ADD CONSTRAINT uk_3idqsvkpmxpehxqv615s952vd UNIQUE (uid);


--
-- Name: uk_3phvecdmy2msmcpitqifpcy3c; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroup
    ADD CONSTRAINT uk_3phvecdmy2msmcpitqifpcy3c UNIQUE (code);


--
-- Name: uk_3r6dr8m9qwa89afngtr43x9jh; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT uk_3r6dr8m9qwa89afngtr43x9jh UNIQUE (uid);


--
-- Name: uk_3svwn20y9qda34bmatesg5c0j; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovalworkflow
    ADD CONSTRAINT uk_3svwn20y9qda34bmatesg5c0j UNIQUE (code);


--
-- Name: uk_3vgkycs0lsgpxaqtytfijr1ji; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programmessage
    ADD CONSTRAINT uk_3vgkycs0lsgpxaqtytfijr1ji UNIQUE (code);


--
-- Name: uk_3yf7d3sycdnv7gk79i7ikwfrv; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_program
    ADD CONSTRAINT uk_3yf7d3sycdnv7gk79i7ikwfrv UNIQUE (code);


--
-- Name: uk_478bg522jkn8460hkeshlw1j1; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY report
    ADD CONSTRAINT uk_478bg522jkn8460hkeshlw1j1 UNIQUE (relativeperiodsid);


--
-- Name: uk_4b97sdsm2p477cc05eody10lm; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY predictor
    ADD CONSTRAINT uk_4b97sdsm2p477cc05eody10lm UNIQUE (name);


--
-- Name: uk_4dlqoc6s8ilws9yhacy5qkddb; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY fileresource
    ADD CONSTRAINT uk_4dlqoc6s8ilws9yhacy5qkddb UNIQUE (code);


--
-- Name: uk_4k3a3mf7dgr4b2btftg5jkmt7; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userkeyjsonvalue
    ADD CONSTRAINT uk_4k3a3mf7dgr4b2btftg5jkmt7 UNIQUE (uid);


--
-- Name: uk_4pi5lfmisrt8un89dnb17xrdy; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategoryoption
    ADD CONSTRAINT uk_4pi5lfmisrt8un89dnb17xrdy UNIQUE (uid);


--
-- Name: uk_50aqn6tun6lt4u3ablvdxgoi6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sqlview
    ADD CONSTRAINT uk_50aqn6tun6lt4u3ablvdxgoi6 UNIQUE (code);


--
-- Name: uk_581ayy658kxytmijcfd2rxnq0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY externalmaplayer
    ADD CONSTRAINT uk_581ayy658kxytmijcfd2rxnq0 UNIQUE (name);


--
-- Name: uk_59abitsfd3u0jx4ntrrblven0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicator
    ADD CONSTRAINT uk_59abitsfd3u0jx4ntrrblven0 UNIQUE (uid);


--
-- Name: uk_5doa30gm9567iy161nfin6kjn; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_mechanismunit
    ADD CONSTRAINT uk_5doa30gm9567iy161nfin6kjn UNIQUE (name);


--
-- Name: uk_5km0xiwk0dg7pnoru5yfvqsdo; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitlevel
    ADD CONSTRAINT uk_5km0xiwk0dg7pnoru5yfvqsdo UNIQUE (uid);


--
-- Name: uk_5mq4bmpyevmr1ddkkopweted1; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovallevel
    ADD CONSTRAINT uk_5mq4bmpyevmr1ddkkopweted1 UNIQUE (name);


--
-- Name: uk_5w429v9hdlvivan4a69x3ntx5; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT uk_5w429v9hdlvivan4a69x3ntx5 UNIQUE (relativeperiodsid);


--
-- Name: uk_60p9gh2un0pb7l9tctfd4o3b3; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptioncombo
    ADD CONSTRAINT uk_60p9gh2un0pb7l9tctfd4o3b3 UNIQUE (code);


--
-- Name: uk_64w4wa4oc3hkxo86hjo63cd1x; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY externalmaplayer
    ADD CONSTRAINT uk_64w4wa4oc3hkxo86hjo63cd1x UNIQUE (uid);


--
-- Name: uk_679r4uoqpust6h694bed8nrh9; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT uk_679r4uoqpust6h694bed8nrh9 UNIQUE (uid);


--
-- Name: uk_694heqsv2ixy46tqm3a0q52ev; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetelement
    ADD CONSTRAINT uk_694heqsv2ixy46tqm3a0q52ev UNIQUE (uid);


--
-- Name: uk_6dyim42vl218i9e9waqrvw36k; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT uk_6dyim42vl218i9e9waqrvw36k UNIQUE (code);


--
-- Name: uk_6itpx2frqt3msln8p32rk7qta; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupset
    ADD CONSTRAINT uk_6itpx2frqt3msln8p32rk7qta UNIQUE (uid);


--
-- Name: uk_6ni8qsiimdcy626hwls002flo; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroup
    ADD CONSTRAINT uk_6ni8qsiimdcy626hwls002flo UNIQUE (name);


--
-- Name: uk_6nm3ynkrtuj01bpo1uwcryq06; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview
    ADD CONSTRAINT uk_6nm3ynkrtuj01bpo1uwcryq06 UNIQUE (code);


--
-- Name: uk_6npcwcyput5ybrd56d07v9q4m; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetelement
    ADD CONSTRAINT uk_6npcwcyput5ybrd56d07v9q4m UNIQUE (code);


--
-- Name: uk_6x37lph70r5mh15a71pf1tj17; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroup
    ADD CONSTRAINT uk_6x37lph70r5mh15a71pf1tj17 UNIQUE (shortname);


--
-- Name: uk_71vrxovabe8x9tom8xwefi3e7; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_71vrxovabe8x9tom8xwefi3e7 UNIQUE (code);


--
-- Name: uk_77crrlh4cbe91h32mnspu2bqx; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programvalidation
    ADD CONSTRAINT uk_77crrlh4cbe91h32mnspu2bqx UNIQUE (code);


--
-- Name: uk_7b9jcu4di1s4yxwfrbv790h3o; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programdataelement
    ADD CONSTRAINT uk_7b9jcu4di1s4yxwfrbv790h3o UNIQUE (uid);


--
-- Name: uk_7carnwjb5dtsk6i5dn43wy9ck; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorgroup
    ADD CONSTRAINT uk_7carnwjb5dtsk6i5dn43wy9ck UNIQUE (name);


--
-- Name: uk_7dgb4dy936irxjv0g7jx93w7k; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_program
    ADD CONSTRAINT uk_7dgb4dy936irxjv0g7jx93w7k UNIQUE (uid);


--
-- Name: uk_7if26yibpw5hn2gjsrn2xst0m; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable
    ADD CONSTRAINT uk_7if26yibpw5hn2gjsrn2xst0m UNIQUE (uid);


--
-- Name: uk_7odx4uo6s5bg55kt1fxky4a8v; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programrule
    ADD CONSTRAINT uk_7odx4uo6s5bg55kt1fxky4a8v UNIQUE (code);


--
-- Name: uk_7rnfvkitq6l0kr5ju2slxopfi; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY relationshiptype
    ADD CONSTRAINT uk_7rnfvkitq6l0kr5ju2slxopfi UNIQUE (uid);


--
-- Name: uk_7udjng39j4ddafjn57r58v7oq; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicator
    ADD CONSTRAINT uk_7udjng39j4ddafjn57r58v7oq UNIQUE (name);


--
-- Name: uk_81gfx3yt7ngwmkk0t8qgcovhi; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionset
    ADD CONSTRAINT uk_81gfx3yt7ngwmkk0t8qgcovhi UNIQUE (uid);


--
-- Name: uk_842ips1xb81udqc3dw5uax7u5; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY maplegendset
    ADD CONSTRAINT uk_842ips1xb81udqc3dw5uax7u5 UNIQUE (name);


--
-- Name: uk_8alvmsgu0onl4i0a0sqb6mqx; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrulegroup
    ADD CONSTRAINT uk_8alvmsgu0onl4i0a0sqb6mqx UNIQUE (uid);


--
-- Name: uk_8d4xrx2gygb4aivpcwrp613hj; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY relationshiptype
    ADD CONSTRAINT uk_8d4xrx2gygb4aivpcwrp613hj UNIQUE (name);


--
-- Name: uk_8dcmrupnoi7hiiom466aoa2y; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatortype
    ADD CONSTRAINT uk_8dcmrupnoi7hiiom466aoa2y UNIQUE (code);


--
-- Name: uk_8eyremdx683wcd9owh1t5jufs; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview
    ADD CONSTRAINT uk_8eyremdx683wcd9owh1t5jufs UNIQUE (relativeperiodsid);


--
-- Name: uk_8ua8n1965xfvefwmpl7xld6lf; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributegroup
    ADD CONSTRAINT uk_8ua8n1965xfvefwmpl7xld6lf UNIQUE (uid);


--
-- Name: uk_8v1lxgqdnnocvm9ah6clxmjf; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY externalfileresource
    ADD CONSTRAINT uk_8v1lxgqdnnocvm9ah6clxmjf UNIQUE (code);


--
-- Name: uk_94srnunkibylfaxt4knxfn58e; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT uk_94srnunkibylfaxt4knxfn58e UNIQUE (code);


--
-- Name: uk_9csrw908a1fvfwbhjwm0jfl4e; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY maplegend
    ADD CONSTRAINT uk_9csrw908a1fvfwbhjwm0jfl4e UNIQUE (uid);


--
-- Name: uk_9ek1ms55rabqdnoo31gqwl9mx; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_nationalunit
    ADD CONSTRAINT uk_9ek1ms55rabqdnoo31gqwl9mx UNIQUE (uid);


--
-- Name: uk_9hvlbsw019hscf35xb5behfx9; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY section
    ADD CONSTRAINT uk_9hvlbsw019hscf35xb5behfx9 UNIQUE (code);


--
-- Name: uk_9j6xjgegveyc0uqs506yy2wrp; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY i18nlocale
    ADD CONSTRAINT uk_9j6xjgegveyc0uqs506yy2wrp UNIQUE (locale);


--
-- Name: uk_9k7bv5o2ut4t0unxcwfyf1ay0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY metadataversion
    ADD CONSTRAINT uk_9k7bv5o2ut4t0unxcwfyf1ay0 UNIQUE (code);


--
-- Name: uk_9mqbhximifdn1n8ru52lan3fw; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY attribute
    ADD CONSTRAINT uk_9mqbhximifdn1n8ru52lan3fw UNIQUE (uid);


--
-- Name: uk_9nbu5m63pd0n13liu13i3nvb5; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart
    ADD CONSTRAINT uk_9nbu5m63pd0n13liu13i3nvb5 UNIQUE (relativeperiodsid);


--
-- Name: uk_9ut6k8m3216v5kjcryy7d2y9w; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrule
    ADD CONSTRAINT uk_9ut6k8m3216v5kjcryy7d2y9w UNIQUE (name);


--
-- Name: uk_9yfyhe9uwhsl0kl6aq3q508s6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_donorunit
    ADD CONSTRAINT uk_9yfyhe9uwhsl0kl6aq3q508s6 UNIQUE (code);


--
-- Name: uk_a50otc0l2chm0heii6scpit4k; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY section
    ADD CONSTRAINT uk_a50otc0l2chm0heii6scpit4k UNIQUE (uid);


--
-- Name: uk_actuoxkkqulslxjpj5hagib9r; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupset
    ADD CONSTRAINT uk_actuoxkkqulslxjpj5hagib9r UNIQUE (code);


--
-- Name: uk_aee54nmg1ci2cpitnpiwa845p; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupset
    ADD CONSTRAINT uk_aee54nmg1ci2cpitnpiwa845p UNIQUE (name);


--
-- Name: uk_aqbaj76r9qxmnylr6p8kj9g37; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroup
    ADD CONSTRAINT uk_aqbaj76r9qxmnylr6p8kj9g37 UNIQUE (name);


--
-- Name: uk_aygjfui3fpgrsxbj6qj782h6f; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY constant
    ADD CONSTRAINT uk_aygjfui3fpgrsxbj6qj782h6f UNIQUE (shortname);


--
-- Name: uk_ayk5ey2r1fh1akknxtpcpyp9r; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT uk_ayk5ey2r1fh1akknxtpcpyp9r UNIQUE (uid);


--
-- Name: uk_b0aojuanxabfuylrbc2k6xk20; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentity
    ADD CONSTRAINT uk_b0aojuanxabfuylrbc2k6xk20 UNIQUE (name);


--
-- Name: uk_b0ii4jdfy88pffbapohsr2lor; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategory
    ADD CONSTRAINT uk_b0ii4jdfy88pffbapohsr2lor UNIQUE (name);


--
-- Name: uk_b39cpkfasrbt96274tbaedtmp; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable
    ADD CONSTRAINT uk_b39cpkfasrbt96274tbaedtmp UNIQUE (relativeperiodsid);


--
-- Name: uk_b3oan3noe4cj9dvyi0amofndv; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstage
    ADD CONSTRAINT uk_b3oan3noe4cj9dvyi0amofndv UNIQUE (uid);


--
-- Name: uk_badofxhbq3oi2d4u7fj8w1kt8; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_badofxhbq3oi2d4u7fj8w1kt8 UNIQUE (openid);


--
-- Name: uk_bjs0n874pj6eoag98jmeidy9a; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupset
    ADD CONSTRAINT uk_bjs0n874pj6eoag98jmeidy9a UNIQUE (code);


--
-- Name: uk_bp0s2a7u6o8w741ymnaisdj5p; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_mechanismunit
    ADD CONSTRAINT uk_bp0s2a7u6o8w741ymnaisdj5p UNIQUE (uid);


--
-- Name: uk_bv71u83esume24hp4gsaj5p4f; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY maplegendset
    ADD CONSTRAINT uk_bv71u83esume24hp4gsaj5p4f UNIQUE (code);


--
-- Name: uk_by4pqq1ans00ffmrgqqh9ehog; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovalworkflow
    ADD CONSTRAINT uk_by4pqq1ans00ffmrgqqh9ehog UNIQUE (uid);


--
-- Name: uk_c8bnosb06cchme5sig7b54uot; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditem
    ADD CONSTRAINT uk_c8bnosb06cchme5sig7b54uot UNIQUE (code);


--
-- Name: uk_cbnc5ktj6whhh690w32k8cyh8; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY color
    ADD CONSTRAINT uk_cbnc5ktj6whhh690w32k8cyh8 UNIQUE (code);


--
-- Name: uk_ccwoighljmk4fy165ipnwl5n4; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY externalfileresource
    ADD CONSTRAINT uk_ccwoighljmk4fy165ipnwl5n4 UNIQUE (uid);


--
-- Name: uk_cswvqawieb2sfq5qsy5wpqp1k; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datastatistics
    ADD CONSTRAINT uk_cswvqawieb2sfq5qsy5wpqp1k UNIQUE (code);


--
-- Name: uk_cto4jvd9q49voite13v0egy3i; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programrulevariable
    ADD CONSTRAINT uk_cto4jvd9q49voite13v0egy3i UNIQUE (code);


--
-- Name: uk_d3lsa2h8me94ksyp53l6rpe3g; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programinstance
    ADD CONSTRAINT uk_d3lsa2h8me94ksyp53l6rpe3g UNIQUE (uid);


--
-- Name: uk_d3qpxp187x8t4c1rsn64crgqu; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY metadataversion
    ADD CONSTRAINT uk_d3qpxp187x8t4c1rsn64crgqu UNIQUE (hashcode);


--
-- Name: uk_d4gp8a84gn643g0r28hdnn4so; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY externalfileresource
    ADD CONSTRAINT uk_d4gp8a84gn643g0r28hdnn4so UNIQUE (fileresourceid);


--
-- Name: uk_d4l5rkqnmc6qdfa6hh11g3h74; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationcriteria
    ADD CONSTRAINT uk_d4l5rkqnmc6qdfa6hh11g3h74 UNIQUE (name);


--
-- Name: uk_dhl0qt8y7hht7krbiym1e9x3n; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataentryform
    ADD CONSTRAINT uk_dhl0qt8y7hht7krbiym1e9x3n UNIQUE (code);


--
-- Name: uk_dlhi39gmt2e0dun73f04w7w7u; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorycombo
    ADD CONSTRAINT uk_dlhi39gmt2e0dun73f04w7w7u UNIQUE (uid);


--
-- Name: uk_do17h5nk71uvc3xjry6kgevj9; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicator
    ADD CONSTRAINT uk_do17h5nk71uvc3xjry6kgevj9 UNIQUE (code);


--
-- Name: uk_do99wgsyk5wflbhb937u5av8m; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY systemsetting
    ADD CONSTRAINT uk_do99wgsyk5wflbhb937u5av8m UNIQUE (name);


--
-- Name: uk_dt8m81o2pw5p9ttid369e92bg; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroup
    ADD CONSTRAINT uk_dt8m81o2pw5p9ttid369e92bg UNIQUE (code);


--
-- Name: uk_dvxv0mw5bonk4pb38o8rctku3; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationcriteria
    ADD CONSTRAINT uk_dvxv0mw5bonk4pb38o8rctku3 UNIQUE (uid);


--
-- Name: uk_e5mhmtj1h7xdfiio2panhapgg; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programrulevariable
    ADD CONSTRAINT uk_e5mhmtj1h7xdfiio2panhapgg UNIQUE (uid);


--
-- Name: uk_e6s6o9jau6tx04m62t7ey4i81; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstage
    ADD CONSTRAINT uk_e6s6o9jau6tx04m62t7ey4i81 UNIQUE (code);


--
-- Name: uk_ec7ehyocpresxxhm7yjstdnwt; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY maplegendset
    ADD CONSTRAINT uk_ec7ehyocpresxxhm7yjstdnwt UNIQUE (uid);


--
-- Name: uk_ecwsxe6wsukqulw5yfeces3n6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_mechanismunit
    ADD CONSTRAINT uk_ecwsxe6wsukqulw5yfeces3n6 UNIQUE (code);


--
-- Name: uk_edy7cktu2fqg01r3n0fjyk1kk; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY constant
    ADD CONSTRAINT uk_edy7cktu2fqg01r3n0fjyk1kk UNIQUE (code);


--
-- Name: uk_efqukogbk7i0poucwoy2qie74; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_efqukogbk7i0poucwoy2qie74 UNIQUE (uid);


--
-- Name: uk_eh2epuhchf9mci86ihl06i31g; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY fileresource
    ADD CONSTRAINT uk_eh2epuhchf9mci86ihl06i31g UNIQUE (uid);


--
-- Name: uk_eh4c3whbwi94nhh772q6l5t7m; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT uk_eh4c3whbwi94nhh772q6l5t7m UNIQUE (code);


--
-- Name: uk_ehl4v33tq7hlkmc28vbno1b4n; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY organisationunit
    ADD CONSTRAINT uk_ehl4v33tq7hlkmc28vbno1b4n UNIQUE (code);


--
-- Name: uk_ekb018cvmpvll5dgtn97leerj; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergroup
    ADD CONSTRAINT uk_ekb018cvmpvll5dgtn97leerj UNIQUE (uid);


--
-- Name: uk_elt3kiqdmmm5fwqfxsxk9lvh0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY document
    ADD CONSTRAINT uk_elt3kiqdmmm5fwqfxsxk9lvh0 UNIQUE (code);


--
-- Name: uk_em6b7qxcas7dn6y506i3nd2x6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY keyjsonvalue
    ADD CONSTRAINT uk_em6b7qxcas7dn6y506i3nd2x6 UNIQUE (uid);


--
-- Name: uk_emoyyyy114ofh6cwo6do8xsi0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY version
    ADD CONSTRAINT uk_emoyyyy114ofh6cwo6do8xsi0 UNIQUE (versionkey);


--
-- Name: uk_emyh4fed0f1kknqhimmrhnek8; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboard
    ADD CONSTRAINT uk_emyh4fed0f1kknqhimmrhnek8 UNIQUE (code);


--
-- Name: uk_en3k8g2rnmf5telm4y4ofoo5t; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongrouptranslations
    ADD CONSTRAINT uk_en3k8g2rnmf5telm4y4ofoo5t UNIQUE (objecttranslationid);


--
-- Name: uk_enhquk04unrpri78inaske3jq; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY predictor
    ADD CONSTRAINT uk_enhquk04unrpri78inaske3jq UNIQUE (uid);


--
-- Name: uk_eqd95mucf5pd856dqlwe6y36c; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT uk_eqd95mucf5pd856dqlwe6y36c UNIQUE (code);


--
-- Name: uk_era92a9b8by4srvq4e7xr4n3k; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_donorunit
    ADD CONSTRAINT uk_era92a9b8by4srvq4e7xr4n3k UNIQUE (shortname);


--
-- Name: uk_evp7d8obarxt3kewepigkwahc; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT uk_evp7d8obarxt3kewepigkwahc UNIQUE (name);


--
-- Name: uk_eyke73kujhkth5elabmkpy4ca; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart
    ADD CONSTRAINT uk_eyke73kujhkth5elabmkpy4ca UNIQUE (code);


--
-- Name: uk_f7wfef3jx1yl73stqs7b45ewb; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorgroup
    ADD CONSTRAINT uk_f7wfef3jx1yl73stqs7b45ewb UNIQUE (code);


--
-- Name: uk_f93o7l4afmkassm3t4f2op9ps; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY metadataversion
    ADD CONSTRAINT uk_f93o7l4afmkassm3t4f2op9ps UNIQUE (name);


--
-- Name: uk_fbferisvig2o4f5owb5lnygf3; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programruleaction
    ADD CONSTRAINT uk_fbferisvig2o4f5owb5lnygf3 UNIQUE (code);


--
-- Name: uk_ff1da38in40mg91rlgqhw02ff; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userrole
    ADD CONSTRAINT uk_ff1da38in40mg91rlgqhw02ff UNIQUE (uid);


--
-- Name: uk_fps2ja521pudngaitlp0805du; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sqlview
    ADD CONSTRAINT uk_fps2ja521pudngaitlp0805du UNIQUE (uid);


--
-- Name: uk_fuentbuhbbr0ix49td9jqlfe5; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupset
    ADD CONSTRAINT uk_fuentbuhbbr0ix49td9jqlfe5 UNIQUE (uid);


--
-- Name: uk_fuq6kda6folarp19oggaf02vb; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program
    ADD CONSTRAINT uk_fuq6kda6folarp19oggaf02vb UNIQUE (code);


--
-- Name: uk_fvgc7isaflcan55g51ysm9df2; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitlevel
    ADD CONSTRAINT uk_fvgc7isaflcan55g51ysm9df2 UNIQUE (code);


--
-- Name: uk_fwso2d10icu8j6720w82tywmq; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY colorset
    ADD CONSTRAINT uk_fwso2d10icu8j6720w82tywmq UNIQUE (code);


--
-- Name: uk_fx3xx9xe0xpurjt6v5p7rv8da; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY oauth2client
    ADD CONSTRAINT uk_fx3xx9xe0xpurjt6v5p7rv8da UNIQUE (uid);


--
-- Name: uk_fymtho48lmccwmlag2amy7gc1; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentity
    ADD CONSTRAINT uk_fymtho48lmccwmlag2amy7gc1 UNIQUE (uid);


--
-- Name: uk_g1nrfjv5x04ap1ceohiwah380; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY organisationunit
    ADD CONSTRAINT uk_g1nrfjv5x04ap1ceohiwah380 UNIQUE (uid);


--
-- Name: uk_gdfuf3j66jxnvwwnksjxqysac; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY oauth2client
    ADD CONSTRAINT uk_gdfuf3j66jxnvwwnksjxqysac UNIQUE (code);


--
-- Name: uk_ge3y4pf6qlne9p7rfmhlvg941; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroup
    ADD CONSTRAINT uk_ge3y4pf6qlne9p7rfmhlvg941 UNIQUE (code);


--
-- Name: uk_gfutgby4wmv3idqnnuhmvnn1; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_agencyunit
    ADD CONSTRAINT uk_gfutgby4wmv3idqnnuhmvnn1 UNIQUE (shortname);


--
-- Name: uk_gg9gc0pyaqjuxi8mr4y93i03w; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT uk_gg9gc0pyaqjuxi8mr4y93i03w UNIQUE (shortname);


--
-- Name: uk_gio4nn8l23jikmebud3jwql43; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY relationshiptype
    ADD CONSTRAINT uk_gio4nn8l23jikmebud3jwql43 UNIQUE (code);


--
-- Name: uk_gky85ptfkcumyuqhr5yvjxwsa; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userinfo
    ADD CONSTRAINT uk_gky85ptfkcumyuqhr5yvjxwsa UNIQUE (code);


--
-- Name: uk_grp9b5jne53f806pc92sfd5s8; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY map
    ADD CONSTRAINT uk_grp9b5jne53f806pc92sfd5s8 UNIQUE (uid);


--
-- Name: uk_gv09xnctko21gdutb55kbxpkr; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_mechanismunit
    ADD CONSTRAINT uk_gv09xnctko21gdutb55kbxpkr UNIQUE (shortname);


--
-- Name: uk_gy44hufdeduoma7eeh3j6abm7; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstageinstance
    ADD CONSTRAINT uk_gy44hufdeduoma7eeh3j6abm7 UNIQUE (uid);


--
-- Name: uk_h4omjcs2ktifdrf2m36u886ae; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program
    ADD CONSTRAINT uk_h4omjcs2ktifdrf2m36u886ae UNIQUE (uid);


--
-- Name: uk_h97pko7n41oky8pfptkflp8l6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorycombo
    ADD CONSTRAINT uk_h97pko7n41oky8pfptkflp8l6 UNIQUE (name);


--
-- Name: uk_hebhkhm8gpwg9xsp8q4f7wlx1; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userrole
    ADD CONSTRAINT uk_hebhkhm8gpwg9xsp8q4f7wlx1 UNIQUE (code);


--
-- Name: uk_hjocbvo9fla04bgj7ku32vwsn; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userrole
    ADD CONSTRAINT uk_hjocbvo9fla04bgj7ku32vwsn UNIQUE (name);


--
-- Name: uk_hpwum0iq12fs4ej5d0tgy6wsn; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY attribute
    ADD CONSTRAINT uk_hpwum0iq12fs4ej5d0tgy6wsn UNIQUE (name);


--
-- Name: uk_hqekpuhjg3g4k4t7xdnu10jy4; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovallevel
    ADD CONSTRAINT uk_hqekpuhjg3g4k4t7xdnu10jy4 UNIQUE (orgunitlevel, categoryoptiongroupsetid);


--
-- Name: uk_hs57i9hma97ps6jpsrbb24lm9; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupset
    ADD CONSTRAINT uk_hs57i9hma97ps6jpsrbb24lm9 UNIQUE (code);


--
-- Name: uk_i1uhc0c8jgxkhlswl9fujsicf; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovallevel
    ADD CONSTRAINT uk_i1uhc0c8jgxkhlswl9fujsicf UNIQUE (uid);


--
-- Name: uk_i21ye30457458gil7t65bjis2; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_nationalunit
    ADD CONSTRAINT uk_i21ye30457458gil7t65bjis2 UNIQUE (name);


--
-- Name: uk_i3uld6ev3xqkpusjdca575y5v; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_donorunit
    ADD CONSTRAINT uk_i3uld6ev3xqkpusjdca575y5v UNIQUE (name);


--
-- Name: uk_i8fi14r4cfuvmqhaai5w1x6fl; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programvalidation
    ADD CONSTRAINT uk_i8fi14r4cfuvmqhaai5w1x6fl UNIQUE (name);


--
-- Name: uk_id4stsb5slq35axmjeojnjnoa; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY maplegend
    ADD CONSTRAINT uk_id4stsb5slq35axmjeojnjnoa UNIQUE (code);


--
-- Name: uk_iedy6hh42wl3gr3m87ntd6so8; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sqlview
    ADD CONSTRAINT uk_iedy6hh42wl3gr3m87ntd6so8 UNIQUE (name);


--
-- Name: uk_j9oya1t1tvj8yn5h8fega4ltr; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroup
    ADD CONSTRAINT uk_j9oya1t1tvj8yn5h8fega4ltr UNIQUE (name);


--
-- Name: uk_jc27pe1xeptws5xprct7mgxrj; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT uk_jc27pe1xeptws5xprct7mgxrj UNIQUE (shortname);


--
-- Name: uk_ji8e92141qdirt8ycldqfkkb9; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programvalidation
    ADD CONSTRAINT uk_ji8e92141qdirt8ycldqfkkb9 UNIQUE (uid);


--
-- Name: uk_jkg0r5akwcxtamstsq9kv4t4p; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_jkg0r5akwcxtamstsq9kv4t4p UNIQUE (ldapid);


--
-- Name: uk_jo65jc3wyrxfekiu3upk80mtr; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroup
    ADD CONSTRAINT uk_jo65jc3wyrxfekiu3upk80mtr UNIQUE (code);


--
-- Name: uk_jxodv1lvot26euasttk021jio; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY document
    ADD CONSTRAINT uk_jxodv1lvot26euasttk021jio UNIQUE (uid);


--
-- Name: uk_jxqj907hbrng860p6mypvl63k; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY fileresource
    ADD CONSTRAINT uk_jxqj907hbrng860p6mypvl63k UNIQUE (storagekey);


--
-- Name: uk_kbqnrdakcjfooofmti30d4p8x; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT uk_kbqnrdakcjfooofmti30d4p8x UNIQUE (uid);


--
-- Name: uk_kc1wmcky1ooleovi36oqcqmqe; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY report
    ADD CONSTRAINT uk_kc1wmcky1ooleovi36oqcqmqe UNIQUE (code);


--
-- Name: uk_ke8p30sy68dl7fggednkimdb6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupset
    ADD CONSTRAINT uk_ke8p30sy68dl7fggednkimdb6 UNIQUE (name);


--
-- Name: uk_kmpefoaw81v4bxpoey6y1y3xl; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicator
    ADD CONSTRAINT uk_kmpefoaw81v4bxpoey6y1y3xl UNIQUE (code);


--
-- Name: uk_kqbwxccoqctky1kdkimjya03s; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroup
    ADD CONSTRAINT uk_kqbwxccoqctky1kdkimjya03s UNIQUE (uid);


--
-- Name: uk_krm9w69donjqsejkmfw17jbcx; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY i18nlocale
    ADD CONSTRAINT uk_krm9w69donjqsejkmfw17jbcx UNIQUE (code);


--
-- Name: uk_ktwf16f728hce9ahtpmm7w5lx; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY metadataversion
    ADD CONSTRAINT uk_ktwf16f728hce9ahtpmm7w5lx UNIQUE (uid);


--
-- Name: uk_l7ls8hffb8au7beso01j8exf4; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_nationalunit
    ADD CONSTRAINT uk_l7ls8hffb8au7beso01j8exf4 UNIQUE (code);


--
-- Name: uk_lgju00pi2jk7y6sl4dkhaykux; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program_attributes
    ADD CONSTRAINT uk_lgju00pi2jk7y6sl4dkhaykux UNIQUE (uid);


--
-- Name: uk_lnnx8vmalkhkmneryv1ytjq68; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT uk_lnnx8vmalkhkmneryv1ytjq68 UNIQUE (uid);


--
-- Name: uk_lrnagoy2wi83nwmataolh7t6d; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroup
    ADD CONSTRAINT uk_lrnagoy2wi83nwmataolh7t6d UNIQUE (shortname);


--
-- Name: uk_lswbn93sime7vmdqqe9lks7ge; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroup
    ADD CONSTRAINT uk_lswbn93sime7vmdqqe9lks7ge UNIQUE (uid);


--
-- Name: uk_ltwhby0s0iwayxrcdu6yefeqt; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitlevel
    ADD CONSTRAINT uk_ltwhby0s0iwayxrcdu6yefeqt UNIQUE (level);


--
-- Name: uk_lu295rc1y01c7p7t76y6ajaas; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupset
    ADD CONSTRAINT uk_lu295rc1y01c7p7t76y6ajaas UNIQUE (uid);


--
-- Name: uk_lvk31hlxg4sl301nxyt1iupd6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable
    ADD CONSTRAINT uk_lvk31hlxg4sl301nxyt1iupd6 UNIQUE (code);


--
-- Name: uk_lycal9jdw3cs0wwebxciswwgr; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagesection
    ADD CONSTRAINT uk_lycal9jdw3cs0wwebxciswwgr UNIQUE (uid);


--
-- Name: uk_mihkls5oq503326b4dvvf2vas; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupsettranslations
    ADD CONSTRAINT uk_mihkls5oq503326b4dvvf2vas UNIQUE (objecttranslationid);


--
-- Name: uk_mlop2afk26fwowa69lr9a138y; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategoryoption
    ADD CONSTRAINT uk_mlop2afk26fwowa69lr9a138y UNIQUE (code);


--
-- Name: uk_myox13mr8r27oxl7ts33ntpd5; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboard
    ADD CONSTRAINT uk_myox13mr8r27oxl7ts33ntpd5 UNIQUE (uid);


--
-- Name: uk_n18s4feicujvngv2ajoesdgio; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovalworkflow
    ADD CONSTRAINT uk_n18s4feicujvngv2ajoesdgio UNIQUE (name);


--
-- Name: uk_n4xputyk31femiaxls6lbl2rw; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupset
    ADD CONSTRAINT uk_n4xputyk31femiaxls6lbl2rw UNIQUE (uid);


--
-- Name: uk_n5ax669vkj63nx3rrvlushqdm; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY pushanalysis
    ADD CONSTRAINT uk_n5ax669vkj63nx3rrvlushqdm UNIQUE (code);


--
-- Name: uk_n8mbmryeksa80ucyxj0vg6p9b; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatortype
    ADD CONSTRAINT uk_n8mbmryeksa80ucyxj0vg6p9b UNIQUE (name);


--
-- Name: uk_naqvtddc07kqoca2nxgn05mgw; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_agencyunit
    ADD CONSTRAINT uk_naqvtddc07kqoca2nxgn05mgw UNIQUE (code);


--
-- Name: uk_ni7epmbxtn4jcax3ya324ff9w; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY oauth2client
    ADD CONSTRAINT uk_ni7epmbxtn4jcax3ya324ff9w UNIQUE (cid);


--
-- Name: uk_nipo7t010a80osh7okxswav2g; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroup
    ADD CONSTRAINT uk_nipo7t010a80osh7okxswav2g UNIQUE (uid);


--
-- Name: uk_nwgvrevv2slj1bvc9m01p89lf; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY oauth2client
    ADD CONSTRAINT uk_nwgvrevv2slj1bvc9m01p89lf UNIQUE (name);


--
-- Name: uk_nwomu20vyjce2jxwdjdfx29lx; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributegroup
    ADD CONSTRAINT uk_nwomu20vyjce2jxwdjdfx29lx UNIQUE (name);


--
-- Name: uk_nwq3y4xqct21tdl0l77bvmpoe; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroup
    ADD CONSTRAINT uk_nwq3y4xqct21tdl0l77bvmpoe UNIQUE (shortname);


--
-- Name: uk_nywvip5682tuvxrnwjomeyg6y; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY constant
    ADD CONSTRAINT uk_nywvip5682tuvxrnwjomeyg6y UNIQUE (uid);


--
-- Name: uk_o061dip9y2yf3otswq0wtjfim; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_donorunit
    ADD CONSTRAINT uk_o061dip9y2yf3otswq0wtjfim UNIQUE (uid);


--
-- Name: uk_o0v1fdqiyte40ffm9q3nhcj4v; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY predictor
    ADD CONSTRAINT uk_o0v1fdqiyte40ffm9q3nhcj4v UNIQUE (code);


--
-- Name: uk_o2xbcli806eba6dkdfco0o3kc; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY constant
    ADD CONSTRAINT uk_o2xbcli806eba6dkdfco0o3kc UNIQUE (name);


--
-- Name: uk_oaeinmk3jp70e5pkrffra5oak; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributegroup
    ADD CONSTRAINT uk_oaeinmk3jp70e5pkrffra5oak UNIQUE (code);


--
-- Name: uk_oeni5ndit5g033f1s1j08bdry; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT uk_oeni5ndit5g033f1s1j08bdry UNIQUE (code);


--
-- Name: uk_ofc2a89rccimogdp9ownwcuy1; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY colorset
    ADD CONSTRAINT uk_ofc2a89rccimogdp9ownwcuy1 UNIQUE (name);


--
-- Name: uk_oj2bhkjfgcl9rcwlf579dl1d6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY colorset
    ADD CONSTRAINT uk_oj2bhkjfgcl9rcwlf579dl1d6 UNIQUE (uid);


--
-- Name: uk_ol8n7oq6clgxvqjedlpn85aqo; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroup
    ADD CONSTRAINT uk_ol8n7oq6clgxvqjedlpn85aqo UNIQUE (uid);


--
-- Name: uk_orq3pwtro2yu9yydh046bn40j; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityinstance
    ADD CONSTRAINT uk_orq3pwtro2yu9yydh046bn40j UNIQUE (code);


--
-- Name: uk_os4r1umsvtmbuqm2bo25s5ej0; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagedataelement
    ADD CONSTRAINT uk_os4r1umsvtmbuqm2bo25s5ej0 UNIQUE (uid);


--
-- Name: uk_ot8a05g9d4k5l67xi062xx5w6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programnotificationtemplate
    ADD CONSTRAINT uk_ot8a05g9d4k5l67xi062xx5w6 UNIQUE (code);


--
-- Name: uk_otvwcgv4bxjtqfj3flhrnmgf7; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroup
    ADD CONSTRAINT uk_otvwcgv4bxjtqfj3flhrnmgf7 UNIQUE (uid);


--
-- Name: uk_p0p3bwhgbsdemu14v23p47qne; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatortype
    ADD CONSTRAINT uk_p0p3bwhgbsdemu14v23p47qne UNIQUE (uid);


--
-- Name: uk_p0rvldurcmk0x3mx39lt5uvsd; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionset
    ADD CONSTRAINT uk_p0rvldurcmk0x3mx39lt5uvsd UNIQUE (name);


--
-- Name: uk_p7arcbl58mmcrj2didtr0ruqh; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programrule
    ADD CONSTRAINT uk_p7arcbl58mmcrj2didtr0ruqh UNIQUE (uid);


--
-- Name: uk_p7egnv3sj4ugyl23mk4vga40k; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupset
    ADD CONSTRAINT uk_p7egnv3sj4ugyl23mk4vga40k UNIQUE (code);


--
-- Name: uk_p8tvo9tqrdn5tb45d0g5cko5o; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataentryform
    ADD CONSTRAINT uk_p8tvo9tqrdn5tb45d0g5cko5o UNIQUE (name);


--
-- Name: uk_pbj3u1nk9vnuof8f47utvowmv; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategoryoption
    ADD CONSTRAINT uk_pbj3u1nk9vnuof8f47utvowmv UNIQUE (name);


--
-- Name: uk_ppi146eky8fodu97t1o21vkd8; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datastatistics
    ADD CONSTRAINT uk_ppi146eky8fodu97t1o21vkd8 UNIQUE (uid);


--
-- Name: uk_pvhokf2i1ujmu92wjokd9xfx8; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_agencyunit
    ADD CONSTRAINT uk_pvhokf2i1ujmu92wjokd9xfx8 UNIQUE (name);


--
-- Name: uk_pw2bgc9ykjad2obefeqha28t4; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY organisationunit
    ADD CONSTRAINT uk_pw2bgc9ykjad2obefeqha28t4 UNIQUE (path);


--
-- Name: uk_pw87bi64e3ev11k7dwrmljo78; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategory
    ADD CONSTRAINT uk_pw87bi64e3ev11k7dwrmljo78 UNIQUE (code);


--
-- Name: uk_q0obvr5rvxhlnjs367y1f0bav; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataentryform
    ADD CONSTRAINT uk_q0obvr5rvxhlnjs367y1f0bav UNIQUE (uid);


--
-- Name: uk_q0oyainj1lis9c8kkh5sky2ri; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT uk_q0oyainj1lis9c8kkh5sky2ri UNIQUE (relativeperiodsid);


--
-- Name: uk_q20sh82vk885ooi7fekwtboej; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergroup
    ADD CONSTRAINT uk_q20sh82vk885ooi7fekwtboej UNIQUE (code);


--
-- Name: uk_q9jv2e3fy49hc1havuwnr0res; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupset
    ADD CONSTRAINT uk_q9jv2e3fy49hc1havuwnr0res UNIQUE (code);


--
-- Name: uk_qki43s9vdndg15c9tyv718u1j; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptioncombo
    ADD CONSTRAINT uk_qki43s9vdndg15c9tyv718u1j UNIQUE (uid);


--
-- Name: uk_qogg9a7yy4qconomxt4j4upql; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY i18nlocale
    ADD CONSTRAINT uk_qogg9a7yy4qconomxt4j4upql UNIQUE (name);


--
-- Name: uk_qp9201a4m6jl53sei0huh4l6s; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategoryoption
    ADD CONSTRAINT uk_qp9201a4m6jl53sei0huh4l6s UNIQUE (shortname);


--
-- Name: uk_qunv1hucv9wi5pt92tur929mr; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY pushanalysis
    ADD CONSTRAINT uk_qunv1hucv9wi5pt92tur929mr UNIQUE (uid);


--
-- Name: uk_qvjybd0unqjn1tsfn0ihsg41x; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_program
    ADD CONSTRAINT uk_qvjybd0unqjn1tsfn0ihsg41x UNIQUE (name);


--
-- Name: uk_qwk9qdapql867enp5r7fa0uic; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroup
    ADD CONSTRAINT uk_qwk9qdapql867enp5r7fa0uic UNIQUE (name);


--
-- Name: uk_r2f9o8i6th2w8vqdexdfo72ui; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program_attributes
    ADD CONSTRAINT uk_r2f9o8i6th2w8vqdexdfo72ui UNIQUE (code);


--
-- Name: uk_r3ugbbibdsyn234isip3346v4; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY externalmaplayer
    ADD CONSTRAINT uk_r3ugbbibdsyn234isip3346v4 UNIQUE (code);


--
-- Name: uk_r43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_r43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- Name: uk_r7hbkahkkbgfg9xtxlp9mhq3q; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentity
    ADD CONSTRAINT uk_r7hbkahkkbgfg9xtxlp9mhq3q UNIQUE (code);


--
-- Name: uk_rbr4kyuk4s0kb4jo1r77cuaq9; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityinstance
    ADD CONSTRAINT uk_rbr4kyuk4s0kb4jo1r77cuaq9 UNIQUE (uid);


--
-- Name: uk_rrv70c7ej18sptdwj7h6ac5rv; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY color
    ADD CONSTRAINT uk_rrv70c7ej18sptdwj7h6ac5rv UNIQUE (uid);


--
-- Name: uk_rvfiukug5ui7qidoiln3el3aa; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionset
    ADD CONSTRAINT uk_rvfiukug5ui7qidoiln3el3aa UNIQUE (code);


--
-- Name: uk_rwk01y8pn2jo3plo7ap28tgb6; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programdataelement
    ADD CONSTRAINT uk_rwk01y8pn2jo3plo7ap28tgb6 UNIQUE (code);


--
-- Name: uk_skin40axv0jcme3bhsbb7156i; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationcriteria
    ADD CONSTRAINT uk_skin40axv0jcme3bhsbb7156i UNIQUE (code);


--
-- Name: uk_sspviu4m0l0lf7ef3t3cagfxd; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroup
    ADD CONSTRAINT uk_sspviu4m0l0lf7ef3t3cagfxd UNIQUE (code);


--
-- Name: uk_t0dg39dopew9f6y64ucsx7194; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrule
    ADD CONSTRAINT uk_t0dg39dopew9f6y64ucsx7194 UNIQUE (uid);


--
-- Name: uk_t0srkng3akwg3pcp5qlwcx06n; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroup
    ADD CONSTRAINT uk_t0srkng3akwg3pcp5qlwcx06n UNIQUE (shortname);


--
-- Name: uk_t5lxvc1km3ylon5st1fuabsgl; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupset
    ADD CONSTRAINT uk_t5lxvc1km3ylon5st1fuabsgl UNIQUE (name);


--
-- Name: uk_ta80keoi67443tkvvmx8l872x; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicator
    ADD CONSTRAINT uk_ta80keoi67443tkvvmx8l872x UNIQUE (uid);


--
-- Name: uk_tbkbjga8h4j5u33d7hbcuk66t; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY period
    ADD CONSTRAINT uk_tbkbjga8h4j5u33d7hbcuk66t UNIQUE (periodtypeid, startdate, enddate);


--
-- Name: uk_tikknlgl0im3w68yvlb0swrgd; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY keyjsonvalue
    ADD CONSTRAINT uk_tikknlgl0im3w68yvlb0swrgd UNIQUE (code);


--
-- Name: userapps_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userapps
    ADD CONSTRAINT userapps_pkey PRIMARY KEY (userinfoid, sort_order);


--
-- Name: userattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userattributevalues
    ADD CONSTRAINT userattributevalues_pkey PRIMARY KEY (userinfoid, attributevalueid);


--
-- Name: userdatavieworgunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userdatavieworgunits
    ADD CONSTRAINT userdatavieworgunits_pkey PRIMARY KEY (userinfoid, organisationunitid);


--
-- Name: usergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergroup
    ADD CONSTRAINT usergroup_pkey PRIMARY KEY (usergroupid);


--
-- Name: usergroupaccess_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergroupaccess
    ADD CONSTRAINT usergroupaccess_pkey PRIMARY KEY (usergroupaccessid);


--
-- Name: usergroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergroupattributevalues
    ADD CONSTRAINT usergroupattributevalues_pkey PRIMARY KEY (usergroupid, attributevalueid);


--
-- Name: usergroupmanaged_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergroupmanaged
    ADD CONSTRAINT usergroupmanaged_pkey PRIMARY KEY (managedbygroupid, managedgroupid);


--
-- Name: usergroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergroupmembers
    ADD CONSTRAINT usergroupmembers_pkey PRIMARY KEY (usergroupid, userid);


--
-- Name: usergrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergrouptranslations
    ADD CONSTRAINT usergrouptranslations_pkey PRIMARY KEY (usergroupid, objecttranslationid);


--
-- Name: usergroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergroupusergroupaccesses
    ADD CONSTRAINT usergroupusergroupaccesses_pkey PRIMARY KEY (usergroupid, usergroupaccessid);


--
-- Name: userinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userinfo
    ADD CONSTRAINT userinfo_pkey PRIMARY KEY (userinfoid);


--
-- Name: userkeyjsonvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userkeyjsonvalue
    ADD CONSTRAINT userkeyjsonvalue_pkey PRIMARY KEY (userkeyjsonvalueid);


--
-- Name: userkeyjsonvalue_unique_key_on_user_and_namespace; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userkeyjsonvalue
    ADD CONSTRAINT userkeyjsonvalue_unique_key_on_user_and_namespace UNIQUE (userid, namespace, userkey);


--
-- Name: usermembership_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usermembership
    ADD CONSTRAINT usermembership_pkey PRIMARY KEY (userinfoid, organisationunitid);


--
-- Name: usermessage_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usermessage
    ADD CONSTRAINT usermessage_pkey PRIMARY KEY (usermessageid);


--
-- Name: userrole_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userrole
    ADD CONSTRAINT userrole_pkey PRIMARY KEY (userroleid);


--
-- Name: userroledataset_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userroledataset
    ADD CONSTRAINT userroledataset_pkey PRIMARY KEY (userroleid, datasetid);


--
-- Name: userrolemembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userrolemembers
    ADD CONSTRAINT userrolemembers_pkey PRIMARY KEY (userid, userroleid);


--
-- Name: userroletranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userroletranslations
    ADD CONSTRAINT userroletranslations_pkey PRIMARY KEY (userroleid, objecttranslationid);


--
-- Name: userroleusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userroleusergroupaccesses
    ADD CONSTRAINT userroleusergroupaccesses_pkey PRIMARY KEY (userroleid, usergroupaccessid);


--
-- Name: users_catdimensionconstraints_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY users_catdimensionconstraints
    ADD CONSTRAINT users_catdimensionconstraints_pkey PRIMARY KEY (userid, dataelementcategoryid);


--
-- Name: users_cogsdimensionconstraints_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY users_cogsdimensionconstraints
    ADD CONSTRAINT users_cogsdimensionconstraints_pkey PRIMARY KEY (userid, categoryoptiongroupsetid);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: usersetting_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usersetting
    ADD CONSTRAINT usersetting_pkey PRIMARY KEY (userinfoid, name);


--
-- Name: userteisearchorgunits_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userteisearchorgunits
    ADD CONSTRAINT userteisearchorgunits_pkey PRIMARY KEY (userinfoid, organisationunitid);


--
-- Name: validationcriteria_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationcriteria
    ADD CONSTRAINT validationcriteria_pkey PRIMARY KEY (validationcriteriaid);


--
-- Name: validationcriteriatranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationcriteriatranslations
    ADD CONSTRAINT validationcriteriatranslations_pkey PRIMARY KEY (validationcriteriaid, objecttranslationid);


--
-- Name: validationrule_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrule
    ADD CONSTRAINT validationrule_pkey PRIMARY KEY (validationruleid);


--
-- Name: validationrulegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrulegroup
    ADD CONSTRAINT validationrulegroup_pkey PRIMARY KEY (validationrulegroupid);


--
-- Name: validationrulegroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrulegroupmembers
    ADD CONSTRAINT validationrulegroupmembers_pkey PRIMARY KEY (validationgroupid, validationruleid);


--
-- Name: validationrulegrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrulegrouptranslations
    ADD CONSTRAINT validationrulegrouptranslations_pkey PRIMARY KEY (validationrulegroupid, objecttranslationid);


--
-- Name: validationrulegroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrulegroupusergroupaccesses
    ADD CONSTRAINT validationrulegroupusergroupaccesses_pkey PRIMARY KEY (validationrulegroupid, usergroupaccessid);


--
-- Name: validationrulegroupusergroupstoalert_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrulegroupusergroupstoalert
    ADD CONSTRAINT validationrulegroupusergroupstoalert_pkey PRIMARY KEY (validationgroupid, usergroupid);


--
-- Name: validationruletranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationruletranslations
    ADD CONSTRAINT validationruletranslations_pkey PRIMARY KEY (validationruleid, objecttranslationid);


--
-- Name: version_pkey; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY version
    ADD CONSTRAINT version_pkey PRIMARY KEY (versionid);


--
-- Name: version_versionkey_key; Type: CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY version
    ADD CONSTRAINT version_versionkey_key UNIQUE (versionkey);


--
-- Name: id_datavalueaudit_created; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX id_datavalueaudit_created ON datavalueaudit USING btree (created);


--
-- Name: in_dataapprovallevel_level; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_dataapprovallevel_level ON dataapprovallevel USING btree (level);


--
-- Name: in_datavalue_deleted; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_datavalue_deleted ON datavalue USING btree (deleted);


--
-- Name: in_datavalue_lastupdated; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_datavalue_lastupdated ON datavalue USING btree (lastupdated);


--
-- Name: in_datavalueaudit; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_datavalueaudit ON datavalueaudit USING btree (dataelementid, periodid, organisationunitid, categoryoptioncomboid, attributeoptioncomboid);


--
-- Name: in_organisationunit_hierarchylevel; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_organisationunit_hierarchylevel ON organisationunit USING btree (hierarchylevel);


--
-- Name: in_organisationunit_path; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_organisationunit_path ON organisationunit USING btree (path);


--
-- Name: in_parentid; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_parentid ON organisationunit USING btree (parentid);


--
-- Name: in_trackedentityattributevalue_attributeid; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX in_trackedentityattributevalue_attributeid ON trackedentityattributevalue USING btree (trackedentityattributeid);


--
-- Name: index_minmaxdataelement; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX index_minmaxdataelement ON minmaxdataelement USING btree (sourceid, dataelementid, categoryoptioncomboid);


--
-- Name: index_programinstance; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX index_programinstance ON programinstance USING btree (programinstanceid);


--
-- Name: interpretation_lastupdated; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX interpretation_lastupdated ON interpretation USING btree (lastupdated);


--
-- Name: maplegend_endvalue; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX maplegend_endvalue ON maplegend USING btree (endvalue);


--
-- Name: maplegend_startvalue; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX maplegend_startvalue ON maplegend USING btree (startvalue);


--
-- Name: messageconversation_lastmessage; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX messageconversation_lastmessage ON messageconversation USING btree (lastmessage);


--
-- Name: outbound_sms_status_index; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX outbound_sms_status_index ON outbound_sms USING btree (status);


--
-- Name: programstageinstance_executiondate; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX programstageinstance_executiondate ON programstageinstance USING btree (executiondate);


--
-- Name: programstageinstance_organisationunitid; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX programstageinstance_organisationunitid ON programstageinstance USING btree (organisationunitid);


--
-- Name: sms_originator_index; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX sms_originator_index ON incomingsms USING btree (originator);


--
-- Name: sms_status_index; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX sms_status_index ON incomingsms USING btree (status);


--
-- Name: userkeyjsonvalue_user; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX userkeyjsonvalue_user ON userkeyjsonvalue USING btree (userid);


--
-- Name: usermessage_isread; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX usermessage_isread ON usermessage USING btree (isread);


--
-- Name: usermessage_userid; Type: INDEX; Schema: public; Owner: dhis
--

CREATE INDEX usermessage_userid ON usermessage USING btree (userid);


--
-- Name: fk14vlc8tv4kna36p6qonceo8ma; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetattributevalues
    ADD CONSTRAINT fk14vlc8tv4kna36p6qonceo8ma FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk1nlm1116kc90wbuo78notvb9v; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupusergroupaccesses
    ADD CONSTRAINT fk1nlm1116kc90wbuo78notvb9v FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fk1swcppe8kkvl6xbm4q47r0gal; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagesectiontranslations
    ADD CONSTRAINT fk1swcppe8kkvl6xbm4q47r0gal FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk1ucfah0si2drvdg2k3j9nj2e9; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorgroupattributevalues
    ADD CONSTRAINT fk1ucfah0si2drvdg2k3j9nj2e9 FOREIGN KEY (programindicatorgroupid) REFERENCES programindicatorgroup(programindicatorgroupid);


--
-- Name: fk25i3g1nx0hyjsim5cybdi73ly; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergroupattributevalues
    ADD CONSTRAINT fk25i3g1nx0hyjsim5cybdi73ly FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk25krkr877ipngidd8k4qkpb38; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttableusergroupaccesses
    ADD CONSTRAINT fk25krkr877ipngidd8k4qkpb38 FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk2ks20e418jsxjhn02ljypa9tq; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY constanttranslations
    ADD CONSTRAINT fk2ks20e418jsxjhn02ljypa9tq FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk2n7d98hdtlwjacpfd8f7bnpgy; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sqlviewattributevalues
    ADD CONSTRAINT fk2n7d98hdtlwjacpfd8f7bnpgy FOREIGN KEY (sqlviewid) REFERENCES sqlview(sqlviewid);


--
-- Name: fk2n9ay939q2uwmieldeypms4cq; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY charttranslations
    ADD CONSTRAINT fk2n9ay939q2uwmieldeypms4cq FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk2sd8w7egccvxbau38rraunkri; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergrouptranslations
    ADD CONSTRAINT fk2sd8w7egccvxbau38rraunkri FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk2tjsnauyet9p1qwk3nnbo7tm3; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorgroupusergroupaccesses
    ADD CONSTRAINT fk2tjsnauyet9p1qwk3nnbo7tm3 FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fk2vbi3ug5jo15ao7pql8ap283j; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorycombousergroupaccesses
    ADD CONSTRAINT fk2vbi3ug5jo15ao7pql8ap283j FOREIGN KEY (categorycomboid) REFERENCES categorycombo(categorycomboid);


--
-- Name: fk2wqhml4htbnncy911df1io95h; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupusergroupaccesses
    ADD CONSTRAINT fk2wqhml4htbnncy911df1io95h FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fk2y3uap3vg76fuvmg2mit64y70; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupattributevalues
    ADD CONSTRAINT fk2y3uap3vg76fuvmg2mit64y70 FOREIGN KEY (categoryoptiongroupid) REFERENCES categoryoptiongroup(categoryoptiongroupid);


--
-- Name: fk3408hwfswvwfqyfngk1tf5ju8; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programmessage_phonenumbers
    ADD CONSTRAINT fk3408hwfswvwfqyfngk1tf5ju8 FOREIGN KEY (programmessagephonenumberid) REFERENCES programmessage(id);


--
-- Name: fk3ewb5ew4m1rarec33519cwcsq; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programmessagetranslations
    ADD CONSTRAINT fk3ewb5ew4m1rarec33519cwcsq FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk3isuwff5den8kdikhctgye0eo; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovalworkflowtranslations
    ADD CONSTRAINT fk3isuwff5den8kdikhctgye0eo FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk3ln0aibaca9diedgu5s8mohbb; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatortranslations
    ADD CONSTRAINT fk3ln0aibaca9diedgu5s8mohbb FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk3s1raibq34uci95vn5fqihjbs; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributeattributevalues
    ADD CONSTRAINT fk3s1raibq34uci95vn5fqihjbs FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fk3sehwiou1hx44bpton2r9ksay; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programvalidationtranslations
    ADD CONSTRAINT fk3sehwiou1hx44bpton2r9ksay FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk3tej1kap633bf97p6qdrd7ivi; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributeusergroupaccesses
    ADD CONSTRAINT fk3tej1kap633bf97p6qdrd7ivi FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk3x7f8b9rivyb7mrc7nf2wgn6v; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupattributevalues
    ADD CONSTRAINT fk3x7f8b9rivyb7mrc7nf2wgn6v FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fk3yae834chn3tsxrv732rb4v5i; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY donorunitusergroupaccesses
    ADD CONSTRAINT fk3yae834chn3tsxrv732rb4v5i FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fk40ivchljqy3lak45vpxj1spvq; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupsetusergroupaccesses
    ADD CONSTRAINT fk40ivchljqy3lak45vpxj1spvq FOREIGN KEY (optiongroupsetid) REFERENCES optiongroupset(optiongroupsetid);


--
-- Name: fk445gf30dsp88q10ukoktc675d; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sqlviewattributevalues
    ADD CONSTRAINT fk445gf30dsp88q10ukoktc675d FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fk45uc7wfpi4u5gunpl127ehkn2; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programnotificationtemplate_deliverychannel
    ADD CONSTRAINT fk45uc7wfpi4u5gunpl127ehkn2 FOREIGN KEY (programnotificationtemplatedeliverychannelid) REFERENCES programnotificationtemplate(programnotificationtemplateid);


--
-- Name: fk46kfj29g8ql52esjjwvfkelas; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgrouptranslations
    ADD CONSTRAINT fk46kfj29g8ql52esjjwvfkelas FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk48oqounwggpawxkgo97qgq42m; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentitytranslations
    ADD CONSTRAINT fk48oqounwggpawxkgo97qgq42m FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk48rkjqk7sell3prjhvgb2wcu0; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetsectiontranslations
    ADD CONSTRAINT fk48rkjqk7sell3prjhvgb2wcu0 FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk4ddpmtxupf3k972xqi2jmwcnb; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatortypetranslations
    ADD CONSTRAINT fk4ddpmtxupf3k972xqi2jmwcnb FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk4hgup0pvaq2lnb5wl0iqrwty1; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementtranslations
    ADD CONSTRAINT fk4hgup0pvaq2lnb5wl0iqrwty1 FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk4j6haj9rbsdi5mg4h2g9bp5f4; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorattributevalues
    ADD CONSTRAINT fk4j6haj9rbsdi5mg4h2g9bp5f4 FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fk4uq2bl31hdu2s4e07rltemk3d; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programnotificationtemplate
    ADD CONSTRAINT fk4uq2bl31hdu2s4e07rltemk3d FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk55kladmsl0xiqpe7b3kfus2kx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionattributevalues
    ADD CONSTRAINT fk55kladmsl0xiqpe7b3kfus2kx FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fk57fqx6vjg8e4yxdr49rh4e2cg; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY interpretationusergroupaccesses
    ADD CONSTRAINT fk57fqx6vjg8e4yxdr49rh4e2cg FOREIGN KEY (interpretationid) REFERENCES interpretation(interpretationid);


--
-- Name: fk5gs2giuqcquw3t7asltw3wjof; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY donorunitusergroupaccesses
    ADD CONSTRAINT fk5gs2giuqcquw3t7asltw3wjof FOREIGN KEY (donorunitid) REFERENCES jphes_donorunit(donorunitid);


--
-- Name: fk5lkioy2ni66gkhk1py1lg2ksk; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovallevelusergroupaccesses
    ADD CONSTRAINT fk5lkioy2ni66gkhk1py1lg2ksk FOREIGN KEY (dataapprovallevelid) REFERENCES dataapprovallevel(dataapprovallevelid);


--
-- Name: fk5mc47seuei76yjk4pne9xco4y; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupusergroupaccesses
    ADD CONSTRAINT fk5mc47seuei76yjk4pne9xco4y FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fk5s4d4l1e7unmm6gholgprl718; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupsettranslations
    ADD CONSTRAINT fk5s4d4l1e7unmm6gholgprl718 FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk5ueo0ouvw1w8ym3bl5a4gy7jb; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovalworkflowusergroupaccesses
    ADD CONSTRAINT fk5ueo0ouvw1w8ym3bl5a4gy7jb FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fk5uw9e42m1bbvtvco3u05w7jtg; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY maplegendsettranslations
    ADD CONSTRAINT fk5uw9e42m1bbvtvco3u05w7jtg FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk6ai10kbk2id10jrjljspsrwsx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY organisationunittranslations
    ADD CONSTRAINT fk6ai10kbk2id10jrjljspsrwsx FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk6eqh97iasvtf9f786haw0fne; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupsetattributevalues
    ADD CONSTRAINT fk6eqh97iasvtf9f786haw0fne FOREIGN KEY (orgunitgroupsetid) REFERENCES orgunitgroupset(orgunitgroupsetid);


--
-- Name: fk6q6o2a3x04ku7vfng6c08dl6m; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY legendsetusergroupaccesses
    ADD CONSTRAINT fk6q6o2a3x04ku7vfng6c08dl6m FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fk6xa8m39mn0dpitxo4eehwikla; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY relationshiptypetranslations
    ADD CONSTRAINT fk6xa8m39mn0dpitxo4eehwikla FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk7a1b7xygd4kd7364syo7igha; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupusergroupaccesses
    ADD CONSTRAINT fk7a1b7xygd4kd7364syo7igha FOREIGN KEY (indicatorgroupid) REFERENCES indicatorgroup(indicatorgroupid);


--
-- Name: fk7aq28bhq2xnps53lpjrgchpoo; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupattributevalues
    ADD CONSTRAINT fk7aq28bhq2xnps53lpjrgchpoo FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fk7f289ja52ca48pnmc2are4k2k; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataentryformtranslations
    ADD CONSTRAINT fk7f289ja52ca48pnmc2are4k2k FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk7foo7k55ee6dko9a0a0jtxavx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorattributevalues
    ADD CONSTRAINT fk7foo7k55ee6dko9a0a0jtxavx FOREIGN KEY (programindicatorid) REFERENCES programindicator(programindicatorid);


--
-- Name: fk7gxwqyqxq8cdxbwpl7unmmi9j; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY constantattributevalues
    ADD CONSTRAINT fk7gxwqyqxq8cdxbwpl7unmmi9j FOREIGN KEY (constantid) REFERENCES constant(constantid);


--
-- Name: fk7qxekcddgur1joowjw5pod8v9; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mechanismunitusergroupaccesses
    ADD CONSTRAINT fk7qxekcddgur1joowjw5pod8v9 FOREIGN KEY (mechanismunitid) REFERENCES jphes_mechanismunit(mechanismunitid);


--
-- Name: fk7utgogpv8n5r4yxm41lhd70i0; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY organisationunitattributevalues
    ADD CONSTRAINT fk7utgogpv8n5r4yxm41lhd70i0 FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk8eefwcsoitkehdl4qbpslnejb; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programattributevalues
    ADD CONSTRAINT fk8eefwcsoitkehdl4qbpslnejb FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk8uk4v6qlon9hw0wlqsnrqj1wy; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategoryusergroupaccesses
    ADD CONSTRAINT fk8uk4v6qlon9hw0wlqsnrqj1wy FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fk8vhnmg1g2etu7mbiqjj0f6ajg; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionsettranslations
    ADD CONSTRAINT fk8vhnmg1g2etu7mbiqjj0f6ajg FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk99kbmh5vouduw7bf7sm6buvbm; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY legendsetusergroupaccesses
    ADD CONSTRAINT fk99kbmh5vouduw7bf7sm6buvbm FOREIGN KEY (maplegendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk9bekfhcd0225ip2lu83ub6hb8; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrulegroupusergroupaccesses
    ADD CONSTRAINT fk9bekfhcd0225ip2lu83ub6hb8 FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fk9jqvlhax7y8ea3i2q1qg4m08o; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstageattributevalues
    ADD CONSTRAINT fk9jqvlhax7y8ea3i2q1qg4m08o FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk9m9l857b29r9ic86qm04sjlmx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userroletranslations
    ADD CONSTRAINT fk9m9l857b29r9ic86qm04sjlmx FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk9tpnab44tsrxexa47qvr6dnq2; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programattributevalues
    ADD CONSTRAINT fk9tpnab44tsrxexa47qvr6dnq2 FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fk9whlsdwfojxbp8yclqolqwm9; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programnotificationtemplate
    ADD CONSTRAINT fk9whlsdwfojxbp8yclqolqwm9 FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk9y8t03jswqlpw5w6v6en2lgnf; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasettranslations
    ADD CONSTRAINT fk9y8t03jswqlpw5w6v6en2lgnf FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk9ylyd0xaehcn0gqr8d2stlr5q; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchartusergroupaccesses
    ADD CONSTRAINT fk9ylyd0xaehcn0gqr8d2stlr5q FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_agencyunit_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_agencyunit
    ADD CONSTRAINT fk_agencyunit_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_agencyunitcategoryoptiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_agencyunit
    ADD CONSTRAINT fk_agencyunitcategoryoptiongroupid FOREIGN KEY (categoryoptiongroupid) REFERENCES categoryoptiongroup(categoryoptiongroupid);


--
-- Name: fk_agencyunitdonorunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_agencyunit
    ADD CONSTRAINT fk_agencyunitdonorunitid FOREIGN KEY (donorunitid) REFERENCES jphes_donorunit(donorunitid);


--
-- Name: fk_agencyunitmechanismunit_mechanismunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_agencyunitmechanismunits
    ADD CONSTRAINT fk_agencyunitmechanismunit_mechanismunitid FOREIGN KEY (mechanismunitid) REFERENCES jphes_mechanismunit(mechanismunitid);


--
-- Name: fk_agencyunitmechanismunits_agencyunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_agencyunitmechanismunits
    ADD CONSTRAINT fk_agencyunitmechanismunits_agencyunitid FOREIGN KEY (agencyunitid) REFERENCES jphes_agencyunit(agencyunitid);


--
-- Name: fk_agencyunitprograms_agencyunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_agencyunitprograms
    ADD CONSTRAINT fk_agencyunitprograms_agencyunitid FOREIGN KEY (agencyunitid) REFERENCES jphes_agencyunit(agencyunitid);


--
-- Name: fk_agencyunitprograms_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_agencyunitprograms
    ADD CONSTRAINT fk_agencyunitprograms_programid FOREIGN KEY (programid) REFERENCES jphes_program(programid);


--
-- Name: fk_agencyunitusergroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_agencyunit
    ADD CONSTRAINT fk_agencyunitusergroupid FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_attribute_optionsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY attribute
    ADD CONSTRAINT fk_attribute_optionsetid FOREIGN KEY (optionsetid) REFERENCES optionset(optionsetid);


--
-- Name: fk_attributereservedvalue_trackedentityattributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributereservedvalue
    ADD CONSTRAINT fk_attributereservedvalue_trackedentityattributeid FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_attributevalue_attributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY attributevalue
    ADD CONSTRAINT fk_attributevalue_attributeid FOREIGN KEY (attributeid) REFERENCES attribute(attributeid);


--
-- Name: fk_attributevalue_trackedentityattributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributevalue
    ADD CONSTRAINT fk_attributevalue_trackedentityattributeid FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_attributevalue_trackedentityinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributereservedvalue
    ADD CONSTRAINT fk_attributevalue_trackedentityinstanceid FOREIGN KEY (trackedentityinstanceid) REFERENCES trackedentityinstance(trackedentityinstanceid);


--
-- Name: fk_attributevalue_trackedentityinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributevalue
    ADD CONSTRAINT fk_attributevalue_trackedentityinstanceid FOREIGN KEY (trackedentityinstanceid) REFERENCES trackedentityinstance(trackedentityinstanceid);


--
-- Name: fk_attributevalueaudit_trackedentityattributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributevalueaudit
    ADD CONSTRAINT fk_attributevalueaudit_trackedentityattributeid FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_attributevalueaudit_trackedentityinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributevalueaudit
    ADD CONSTRAINT fk_attributevalueaudit_trackedentityinstanceid FOREIGN KEY (trackedentityinstanceid) REFERENCES trackedentityinstance(trackedentityinstanceid);


--
-- Name: fk_categories_categoryoptions_categoryid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categories_categoryoptions
    ADD CONSTRAINT fk_categories_categoryoptions_categoryid FOREIGN KEY (categoryid) REFERENCES dataelementcategory(categoryid);


--
-- Name: fk_category_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categories_categoryoptions
    ADD CONSTRAINT fk_category_categoryoptionid FOREIGN KEY (categoryoptionid) REFERENCES dataelementcategoryoption(categoryoptionid);


--
-- Name: fk_categorycombo_categoryid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorycombos_categories
    ADD CONSTRAINT fk_categorycombo_categoryid FOREIGN KEY (categoryid) REFERENCES dataelementcategory(categoryid);


--
-- Name: fk_categorycombo_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorycombos_optioncombos
    ADD CONSTRAINT fk_categorycombo_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_categorycombo_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorycombo
    ADD CONSTRAINT fk_categorycombo_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_categorycombos_categories_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorycombos_categories
    ADD CONSTRAINT fk_categorycombos_categories_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES categorycombo(categorycomboid);


--
-- Name: fk_categorycombos_optioncombos_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorycombos_optioncombos
    ADD CONSTRAINT fk_categorycombos_optioncombos_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES categorycombo(categorycomboid);


--
-- Name: fk_categorydimension_category; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorydimension
    ADD CONSTRAINT fk_categorydimension_category FOREIGN KEY (categoryid) REFERENCES dataelementcategory(categoryid);


--
-- Name: fk_categorydimension_items_categorydimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorydimension_items
    ADD CONSTRAINT fk_categorydimension_items_categorydimensionid FOREIGN KEY (categorydimensionid) REFERENCES categorydimension(categorydimensionid);


--
-- Name: fk_categorydimension_items_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorydimension_items
    ADD CONSTRAINT fk_categorydimension_items_categoryoptionid FOREIGN KEY (categoryoptionid) REFERENCES dataelementcategoryoption(categoryoptionid);


--
-- Name: fk_categoryoption_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptioncombos_categoryoptions
    ADD CONSTRAINT fk_categoryoption_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_categoryoption_organisationunits_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoption_organisationunits
    ADD CONSTRAINT fk_categoryoption_organisationunits_categoryoptionid FOREIGN KEY (categoryoptionid) REFERENCES dataelementcategoryoption(categoryoptionid);


--
-- Name: fk_categoryoption_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoption_organisationunits
    ADD CONSTRAINT fk_categoryoption_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_categoryoptioncombo_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptioncombos_categoryoptions
    ADD CONSTRAINT fk_categoryoptioncombo_categoryoptionid FOREIGN KEY (categoryoptionid) REFERENCES dataelementcategoryoption(categoryoptionid);


--
-- Name: fk_categoryoptioncombos_categoryoptions_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptioncombos_categoryoptions
    ADD CONSTRAINT fk_categoryoptioncombos_categoryoptions_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_categoryoptioncombos_categoryoptions_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptioncombos_categoryoptions
    ADD CONSTRAINT fk_categoryoptioncombos_categoryoptions_categoryoptionid FOREIGN KEY (categoryoptionid) REFERENCES dataelementcategoryoption(categoryoptionid);


--
-- Name: fk_categoryoptiongroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroup
    ADD CONSTRAINT fk_categoryoptiongroup_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_categoryoptiongroupmembers_categoryoptiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupmembers
    ADD CONSTRAINT fk_categoryoptiongroupmembers_categoryoptiongroupid FOREIGN KEY (categoryoptionid) REFERENCES dataelementcategoryoption(categoryoptionid);


--
-- Name: fk_categoryoptiongroupmembers_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupmembers
    ADD CONSTRAINT fk_categoryoptiongroupmembers_categoryoptionid FOREIGN KEY (categoryoptiongroupid) REFERENCES categoryoptiongroup(categoryoptiongroupid);


--
-- Name: fk_categoryoptiongroupset_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupset
    ADD CONSTRAINT fk_categoryoptiongroupset_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_categoryoptiongroupsetmembers_categoryoptiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupsetmembers
    ADD CONSTRAINT fk_categoryoptiongroupsetmembers_categoryoptiongroupid FOREIGN KEY (categoryoptiongroupid) REFERENCES categoryoptiongroup(categoryoptiongroupid);


--
-- Name: fk_categoryoptiongroupsetmembers_categoryoptiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupsetmembers
    ADD CONSTRAINT fk_categoryoptiongroupsetmembers_categoryoptiongroupsetid FOREIGN KEY (categoryoptiongroupsetid) REFERENCES categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: fk_chart_categorydimensions_categorydimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_categorydimensions
    ADD CONSTRAINT fk_chart_categorydimensions_categorydimensionid FOREIGN KEY (categorydimensionid) REFERENCES categorydimension(categorydimensionid);


--
-- Name: fk_chart_categorydimensions_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_categorydimensions
    ADD CONSTRAINT fk_chart_categorydimensions_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_chart_categoryoptiongroups_categoryoptiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_categoryoptiongroups
    ADD CONSTRAINT fk_chart_categoryoptiongroups_categoryoptiongroupid FOREIGN KEY (categoryoptiongroupid) REFERENCES categoryoptiongroup(categoryoptiongroupid);


--
-- Name: fk_chart_categoryoptiongroups_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_categoryoptiongroups
    ADD CONSTRAINT fk_chart_categoryoptiongroups_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_chart_datadimensionitems_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_datadimensionitems
    ADD CONSTRAINT fk_chart_datadimensionitems_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_chart_datadimensionitems_datadimensionitemid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_datadimensionitems
    ADD CONSTRAINT fk_chart_datadimensionitems_datadimensionitemid FOREIGN KEY (datadimensionitemid) REFERENCES datadimensionitem(datadimensionitemid);


--
-- Name: fk_chart_dataelementgroups_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_dataelementgroups
    ADD CONSTRAINT fk_chart_dataelementgroups_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_chart_dataelementgroups_dataelementgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_dataelementgroups
    ADD CONSTRAINT fk_chart_dataelementgroups_dataelementgroupid FOREIGN KEY (dataelementgroupid) REFERENCES dataelementgroup(dataelementgroupid);


--
-- Name: fk_chart_itemorgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_itemorgunitgroups
    ADD CONSTRAINT fk_chart_itemorgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_chart_itemorgunitunitgroups_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_itemorgunitgroups
    ADD CONSTRAINT fk_chart_itemorgunitunitgroups_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_chart_organisationunits_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_organisationunits
    ADD CONSTRAINT fk_chart_organisationunits_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_chart_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_organisationunits
    ADD CONSTRAINT fk_chart_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_chart_orgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_orgunitgroups
    ADD CONSTRAINT fk_chart_orgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_chart_orgunitlevels_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_orgunitlevels
    ADD CONSTRAINT fk_chart_orgunitlevels_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_chart_orgunitunitgroups_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_orgunitgroups
    ADD CONSTRAINT fk_chart_orgunitunitgroups_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_chart_periods_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_periods
    ADD CONSTRAINT fk_chart_periods_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_chart_periods_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_periods
    ADD CONSTRAINT fk_chart_periods_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_chart_relativeperiodsid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart
    ADD CONSTRAINT fk_chart_relativeperiodsid FOREIGN KEY (relativeperiodsid) REFERENCES relativeperiods(relativeperiodsid);


--
-- Name: fk_chart_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart
    ADD CONSTRAINT fk_chart_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_colorset_colors_colorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY colorset_colors
    ADD CONSTRAINT fk_colorset_colors_colorid FOREIGN KEY (colorid) REFERENCES color(colorid);


--
-- Name: fk_colorset_colors_colorsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY colorset_colors
    ADD CONSTRAINT fk_colorset_colors_colorsetid FOREIGN KEY (colorsetid) REFERENCES colorset(colorsetid);


--
-- Name: fk_completedatasetregistration_attributeoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY completedatasetregistration
    ADD CONSTRAINT fk_completedatasetregistration_attributeoptioncomboid FOREIGN KEY (attributeoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_completedatasetregistration_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY completedatasetregistration
    ADD CONSTRAINT fk_completedatasetregistration_organisationunitid FOREIGN KEY (sourceid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_configuration_corswhitelist; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY configuration_corswhitelist
    ADD CONSTRAINT fk_configuration_corswhitelist FOREIGN KEY (configurationid) REFERENCES configuration(configurationid);


--
-- Name: fk_configuration_feedback_recipients; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT fk_configuration_feedback_recipients FOREIGN KEY (feedbackrecipientsid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_configuration_infrastructural_dataelements; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT fk_configuration_infrastructural_dataelements FOREIGN KEY (infrastructuraldataelementsid) REFERENCES dataelementgroup(dataelementgroupid);


--
-- Name: fk_configuration_infrastructural_indicators; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT fk_configuration_infrastructural_indicators FOREIGN KEY (infrastructuralindicatorsid) REFERENCES indicatorgroup(indicatorgroupid);


--
-- Name: fk_configuration_infrastructural_periodtype; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT fk_configuration_infrastructural_periodtype FOREIGN KEY (infrastructuralperiodtypeid) REFERENCES periodtype(periodtypeid);


--
-- Name: fk_configuration_offline_orgunit_level; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT fk_configuration_offline_orgunit_level FOREIGN KEY (offlineorgunitlevelid) REFERENCES orgunitlevel(orgunitlevelid);


--
-- Name: fk_configuration_selfregistrationorgunit; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT fk_configuration_selfregistrationorgunit FOREIGN KEY (selfregistrationorgunit) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_configuration_selfregistrationrole; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT fk_configuration_selfregistrationrole FOREIGN KEY (selfregistrationrole) REFERENCES userrole(userroleid);


--
-- Name: fk_constant_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY constant
    ADD CONSTRAINT fk_constant_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dashboard_items_dashboardid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboard_items
    ADD CONSTRAINT fk_dashboard_items_dashboardid FOREIGN KEY (dashboardid) REFERENCES dashboard(dashboardid);


--
-- Name: fk_dashboard_items_dashboarditemid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboard_items
    ADD CONSTRAINT fk_dashboard_items_dashboarditemid FOREIGN KEY (dashboarditemid) REFERENCES dashboarditem(dashboarditemid);


--
-- Name: fk_dashboard_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboard
    ADD CONSTRAINT fk_dashboard_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dashboarditem_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditem
    ADD CONSTRAINT fk_dashboarditem_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_dashboarditem_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditem
    ADD CONSTRAINT fk_dashboarditem_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_dashboarditem_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditem
    ADD CONSTRAINT fk_dashboarditem_eventreportid FOREIGN KEY (eventreport) REFERENCES eventreport(eventreportid);


--
-- Name: fk_dashboarditem_mapid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditem
    ADD CONSTRAINT fk_dashboarditem_mapid FOREIGN KEY (mapid) REFERENCES map(mapid);


--
-- Name: fk_dashboarditem_reports_dashboardid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditem_reports
    ADD CONSTRAINT fk_dashboarditem_reports_dashboardid FOREIGN KEY (dashboarditemid) REFERENCES dashboarditem(dashboarditemid);


--
-- Name: fk_dashboarditem_reports_reportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditem_reports
    ADD CONSTRAINT fk_dashboarditem_reports_reportid FOREIGN KEY (reportid) REFERENCES report(reportid);


--
-- Name: fk_dashboarditem_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditem
    ADD CONSTRAINT fk_dashboarditem_reporttableid FOREIGN KEY (reporttable) REFERENCES reporttable(reporttableid);


--
-- Name: fk_dashboarditem_resources_dashboardid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditem_resources
    ADD CONSTRAINT fk_dashboarditem_resources_dashboardid FOREIGN KEY (dashboarditemid) REFERENCES dashboarditem(dashboarditemid);


--
-- Name: fk_dashboarditem_resources_resourceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditem_resources
    ADD CONSTRAINT fk_dashboarditem_resources_resourceid FOREIGN KEY (resourceid) REFERENCES document(documentid);


--
-- Name: fk_dashboarditem_users_dashboardid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditem_users
    ADD CONSTRAINT fk_dashboarditem_users_dashboardid FOREIGN KEY (dashboarditemid) REFERENCES dashboarditem(dashboarditemid);


--
-- Name: fk_dashboarditem_users_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditem_users
    ADD CONSTRAINT fk_dashboarditem_users_userinfoid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataapproval_attributeoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapproval
    ADD CONSTRAINT fk_dataapproval_attributeoptioncomboid FOREIGN KEY (attributeoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_dataapproval_creator; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapproval
    ADD CONSTRAINT fk_dataapproval_creator FOREIGN KEY (creator) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataapproval_dataapprovallevel; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapproval
    ADD CONSTRAINT fk_dataapproval_dataapprovallevel FOREIGN KEY (dataapprovallevelid) REFERENCES dataapprovallevel(dataapprovallevelid);


--
-- Name: fk_dataapproval_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapproval
    ADD CONSTRAINT fk_dataapproval_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_dataapproval_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapproval
    ADD CONSTRAINT fk_dataapproval_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_dataapproval_workflowid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapproval
    ADD CONSTRAINT fk_dataapproval_workflowid FOREIGN KEY (workflowid) REFERENCES dataapprovalworkflow(workflowid);


--
-- Name: fk_dataapprovallevel_categoryoptiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovallevel
    ADD CONSTRAINT fk_dataapprovallevel_categoryoptiongroupsetid FOREIGN KEY (categoryoptiongroupsetid) REFERENCES categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: fk_dataapprovallevel_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovallevel
    ADD CONSTRAINT fk_dataapprovallevel_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataapprovalworkflow_periodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovalworkflow
    ADD CONSTRAINT fk_dataapprovalworkflow_periodtypeid FOREIGN KEY (periodtypeid) REFERENCES periodtype(periodtypeid);


--
-- Name: fk_dataapprovalworkflow_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovalworkflow
    ADD CONSTRAINT fk_dataapprovalworkflow_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataapprovalworkflowlevels_levelid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovalworkflowlevels
    ADD CONSTRAINT fk_dataapprovalworkflowlevels_levelid FOREIGN KEY (dataapprovallevelid) REFERENCES dataapprovallevel(dataapprovallevelid);


--
-- Name: fk_dataapprovalworkflowlevels_workflowid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovalworkflowlevels
    ADD CONSTRAINT fk_dataapprovalworkflowlevels_workflowid FOREIGN KEY (workflowid) REFERENCES dataapprovalworkflow(workflowid);


--
-- Name: fk_datadimensionitem_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_datadimensionitem_dataelementoperandid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_dataelementoperandid FOREIGN KEY (dataelementoperandid) REFERENCES dataelementoperand(dataelementoperandid);


--
-- Name: fk_datadimensionitem_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_datadimensionitem_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_indicatorid FOREIGN KEY (indicatorid) REFERENCES indicator(indicatorid);


--
-- Name: fk_datadimensionitem_programattributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_programattributeid FOREIGN KEY (programattributeid) REFERENCES program_attributes(programtrackedentityattributeid);


--
-- Name: fk_datadimensionitem_programdataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_programdataelementid FOREIGN KEY (programdataelementid) REFERENCES programdataelement(programdataelementid);


--
-- Name: fk_datadimensionitem_programindicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_programindicatorid FOREIGN KEY (programindicatorid) REFERENCES programindicator(programindicatorid);


--
-- Name: fk_dataelement_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT fk_dataelement_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES categorycombo(categorycomboid);


--
-- Name: fk_dataelement_commentoptionsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT fk_dataelement_commentoptionsetid FOREIGN KEY (commentoptionsetid) REFERENCES optionset(optionsetid);


--
-- Name: fk_dataelement_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY smscodes
    ADD CONSTRAINT fk_dataelement_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_dataelement_legendset; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT fk_dataelement_legendset FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_dataelement_optionsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT fk_dataelement_optionsetid FOREIGN KEY (optionsetid) REFERENCES optionset(optionsetid);


--
-- Name: fk_dataelement_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT fk_dataelement_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataelementaggregationlevels_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementaggregationlevels
    ADD CONSTRAINT fk_dataelementaggregationlevels_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_dataelementcategory_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategory
    ADD CONSTRAINT fk_dataelementcategory_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataelementcategoryoption_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategoryoption
    ADD CONSTRAINT fk_dataelementcategoryoption_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataelementgroup_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupmembers
    ADD CONSTRAINT fk_dataelementgroup_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_dataelementgroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroup
    ADD CONSTRAINT fk_dataelementgroup_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataelementgroupmembers_dataelementgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupmembers
    ADD CONSTRAINT fk_dataelementgroupmembers_dataelementgroupid FOREIGN KEY (dataelementgroupid) REFERENCES dataelementgroup(dataelementgroupid);


--
-- Name: fk_dataelementgroupset_dataelementgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupsetmembers
    ADD CONSTRAINT fk_dataelementgroupset_dataelementgroupid FOREIGN KEY (dataelementgroupid) REFERENCES dataelementgroup(dataelementgroupid);


--
-- Name: fk_dataelementgroupset_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupset
    ADD CONSTRAINT fk_dataelementgroupset_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataelementgroupsetmembers_dataelementgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupsetmembers
    ADD CONSTRAINT fk_dataelementgroupsetmembers_dataelementgroupsetid FOREIGN KEY (dataelementgroupsetid) REFERENCES dataelementgroupset(dataelementgroupsetid);


--
-- Name: fk_dataelementoperand_dataelement; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementoperand
    ADD CONSTRAINT fk_dataelementoperand_dataelement FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_dataelementoperand_dataelementcategoryoptioncombo; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementoperand
    ADD CONSTRAINT fk_dataelementoperand_dataelementcategoryoptioncombo FOREIGN KEY (categoryoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_dataset_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT fk_dataset_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES categorycombo(categorycomboid);


--
-- Name: fk_dataset_dataelementoperandid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetoperands
    ADD CONSTRAINT fk_dataset_dataelementoperandid FOREIGN KEY (dataelementoperandid) REFERENCES dataelementoperand(dataelementoperandid);


--
-- Name: fk_dataset_dataentryform; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT fk_dataset_dataentryform FOREIGN KEY (dataentryform) REFERENCES dataentryform(dataentryformid);


--
-- Name: fk_dataset_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY smscommands
    ADD CONSTRAINT fk_dataset_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_dataset_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetindicators
    ADD CONSTRAINT fk_dataset_indicatorid FOREIGN KEY (indicatorid) REFERENCES indicator(indicatorid);


--
-- Name: fk_dataset_legendset; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT fk_dataset_legendset FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_dataset_notificationrecipients; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT fk_dataset_notificationrecipients FOREIGN KEY (notificationrecipients) REFERENCES usergroup(usergroupid);


--
-- Name: fk_dataset_organisationunit; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetsource
    ADD CONSTRAINT fk_dataset_organisationunit FOREIGN KEY (sourceid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_dataset_periodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT fk_dataset_periodtypeid FOREIGN KEY (periodtypeid) REFERENCES periodtype(periodtypeid);


--
-- Name: fk_dataset_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT fk_dataset_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataset_workflowid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT fk_dataset_workflowid FOREIGN KEY (workflowid) REFERENCES dataapprovalworkflow(workflowid);


--
-- Name: fk_datasetcompleteregistration_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY completedatasetregistration
    ADD CONSTRAINT fk_datasetcompleteregistration_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_datasetcompleteregistration_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY completedatasetregistration
    ADD CONSTRAINT fk_datasetcompleteregistration_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_datasetelement_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetelement
    ADD CONSTRAINT fk_datasetelement_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES categorycombo(categorycomboid);


--
-- Name: fk_datasetindicators_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetindicators
    ADD CONSTRAINT fk_datasetindicators_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_datasetmembers_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetelement
    ADD CONSTRAINT fk_datasetmembers_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_datasetmembers_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetelement
    ADD CONSTRAINT fk_datasetmembers_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_datasetoperands_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetoperands
    ADD CONSTRAINT fk_datasetoperands_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_datasetsource_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetsource
    ADD CONSTRAINT fk_datasetsource_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_datavalue_attributeoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datavalue
    ADD CONSTRAINT fk_datavalue_attributeoptioncomboid FOREIGN KEY (attributeoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_datavalue_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datavalue
    ADD CONSTRAINT fk_datavalue_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_datavalue_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datavalue
    ADD CONSTRAINT fk_datavalue_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_datavalue_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datavalue
    ADD CONSTRAINT fk_datavalue_organisationunitid FOREIGN KEY (sourceid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_datavalue_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datavalue
    ADD CONSTRAINT fk_datavalue_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_datavalueaudit_attributeoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datavalueaudit
    ADD CONSTRAINT fk_datavalueaudit_attributeoptioncomboid FOREIGN KEY (attributeoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_datavalueaudit_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datavalueaudit
    ADD CONSTRAINT fk_datavalueaudit_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_datavalueaudit_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datavalueaudit
    ADD CONSTRAINT fk_datavalueaudit_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_datavalueaudit_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datavalueaudit
    ADD CONSTRAINT fk_datavalueaudit_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_datavalueaudit_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datavalueaudit
    ADD CONSTRAINT fk_datavalueaudit_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_document_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY document
    ADD CONSTRAINT fk_document_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_donorunit_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_donorunit
    ADD CONSTRAINT fk_donorunit_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_donorunitagencyunits_agencyunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_donorunitagencyunits
    ADD CONSTRAINT fk_donorunitagencyunits_agencyunitid FOREIGN KEY (agencyunitid) REFERENCES jphes_agencyunit(agencyunitid);


--
-- Name: fk_donorunitagencyunits_donorunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_donorunitagencyunits
    ADD CONSTRAINT fk_donorunitagencyunits_donorunitid FOREIGN KEY (donorunitid) REFERENCES jphes_donorunit(donorunitid);


--
-- Name: fk_donorunitcategoryoptiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_donorunit
    ADD CONSTRAINT fk_donorunitcategoryoptiongroupid FOREIGN KEY (categoryoptiongroupid) REFERENCES categoryoptiongroup(categoryoptiongroupid);


--
-- Name: fk_donorunitcategoryoptiongroupsetagencyid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_nationalunit
    ADD CONSTRAINT fk_donorunitcategoryoptiongroupsetagencyid FOREIGN KEY (categoryoptiongroupsetagencyid) REFERENCES categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: fk_donorunitnationalunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_donorunit
    ADD CONSTRAINT fk_donorunitnationalunitid FOREIGN KEY (nationalunitid) REFERENCES jphes_nationalunit(nationalunitid);


--
-- Name: fk_donorunitprograms_donorunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_donorunitprograms
    ADD CONSTRAINT fk_donorunitprograms_donorunitid FOREIGN KEY (donorunitid) REFERENCES jphes_donorunit(donorunitid);


--
-- Name: fk_donorunitprograms_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_donorunitprograms
    ADD CONSTRAINT fk_donorunitprograms_programid FOREIGN KEY (programid) REFERENCES jphes_program(programid);


--
-- Name: fk_donorunitusergroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_donorunit
    ADD CONSTRAINT fk_donorunitusergroupid FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_entityinstancedatavalue_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentitydatavalue
    ADD CONSTRAINT fk_entityinstancedatavalue_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_entityinstancedatavalue_programstageinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentitydatavalue
    ADD CONSTRAINT fk_entityinstancedatavalue_programstageinstanceid FOREIGN KEY (programstageinstanceid) REFERENCES programstageinstance(programstageinstanceid);


--
-- Name: fk_entityinstancedatavalueaudit_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentitydatavalueaudit
    ADD CONSTRAINT fk_entityinstancedatavalueaudit_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_entityinstancedatavalueaudit_programstageinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentitydatavalueaudit
    ADD CONSTRAINT fk_entityinstancedatavalueaudit_programstageinstanceid FOREIGN KEY (programstageinstanceid) REFERENCES programstageinstance(programstageinstanceid);


--
-- Name: fk_eventchart_attributedimensions_attributedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_attributedimensions
    ADD CONSTRAINT fk_eventchart_attributedimensions_attributedimensionid FOREIGN KEY (trackedentityattributedimensionid) REFERENCES trackedentityattributedimension(trackedentityattributedimensionid);


--
-- Name: fk_eventchart_attributedimensions_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_attributedimensions
    ADD CONSTRAINT fk_eventchart_attributedimensions_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_attributevaluedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT fk_eventchart_attributevaluedimensionid FOREIGN KEY (attributevaluedimensionid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_eventchart_columns_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_columns
    ADD CONSTRAINT fk_eventchart_columns_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_dataelementdimensions_dataelementdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_dataelementdimensions
    ADD CONSTRAINT fk_eventchart_dataelementdimensions_dataelementdimensionid FOREIGN KEY (trackedentitydataelementdimensionid) REFERENCES trackedentitydataelementdimension(trackedentitydataelementdimensionid);


--
-- Name: fk_eventchart_dataelementdimensions_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_dataelementdimensions
    ADD CONSTRAINT fk_eventchart_dataelementdimensions_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_dataelementvaluedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT fk_eventchart_dataelementvaluedimensionid FOREIGN KEY (dataelementvaluedimensionid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_eventchart_filters_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_filters
    ADD CONSTRAINT fk_eventchart_filters_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_itemorgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_itemorgunitgroups
    ADD CONSTRAINT fk_eventchart_itemorgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_eventchart_itemorgunitunitgroups_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_itemorgunitgroups
    ADD CONSTRAINT fk_eventchart_itemorgunitunitgroups_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_organisationunits_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_organisationunits
    ADD CONSTRAINT fk_eventchart_organisationunits_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_organisationunits
    ADD CONSTRAINT fk_eventchart_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_eventchart_orgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_orgunitgroups
    ADD CONSTRAINT fk_eventchart_orgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_eventchart_orgunitlevels_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_orgunitlevels
    ADD CONSTRAINT fk_eventchart_orgunitlevels_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_orgunitunitgroups_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_orgunitgroups
    ADD CONSTRAINT fk_eventchart_orgunitunitgroups_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_periods_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_periods
    ADD CONSTRAINT fk_eventchart_periods_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_periods_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_periods
    ADD CONSTRAINT fk_eventchart_periods_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_eventchart_prindicatordimensions_prindicatordimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_programindicatordimensions
    ADD CONSTRAINT fk_eventchart_prindicatordimensions_prindicatordimensionid FOREIGN KEY (trackedentityprogramindicatordimensionid) REFERENCES trackedentityprogramindicatordimension(trackedentityprogramindicatordimensionid);


--
-- Name: fk_eventchart_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT fk_eventchart_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_eventchart_programindicatordimensions_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_programindicatordimensions
    ADD CONSTRAINT fk_eventchart_programindicatordimensions_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT fk_eventchart_programstageid FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_eventchart_relativeperiodsid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT fk_eventchart_relativeperiodsid FOREIGN KEY (relativeperiodsid) REFERENCES relativeperiods(relativeperiodsid);


--
-- Name: fk_eventchart_rows_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart_rows
    ADD CONSTRAINT fk_eventchart_rows_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT fk_eventchart_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_eventreport_attributedimensions_attributedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_attributedimensions
    ADD CONSTRAINT fk_eventreport_attributedimensions_attributedimensionid FOREIGN KEY (trackedentityattributedimensionid) REFERENCES trackedentityattributedimension(trackedentityattributedimensionid);


--
-- Name: fk_eventreport_attributedimensions_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_attributedimensions
    ADD CONSTRAINT fk_eventreport_attributedimensions_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_attributevaluedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT fk_eventreport_attributevaluedimensionid FOREIGN KEY (attributevaluedimensionid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_eventreport_columns_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_columns
    ADD CONSTRAINT fk_eventreport_columns_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_dataelementdimensions_dataelementdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_dataelementdimensions
    ADD CONSTRAINT fk_eventreport_dataelementdimensions_dataelementdimensionid FOREIGN KEY (trackedentitydataelementdimensionid) REFERENCES trackedentitydataelementdimension(trackedentitydataelementdimensionid);


--
-- Name: fk_eventreport_dataelementdimensions_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_dataelementdimensions
    ADD CONSTRAINT fk_eventreport_dataelementdimensions_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_dataelementvaluedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT fk_eventreport_dataelementvaluedimensionid FOREIGN KEY (dataelementvaluedimensionid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_eventreport_filters_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_filters
    ADD CONSTRAINT fk_eventreport_filters_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_itemorgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_itemorgunitgroups
    ADD CONSTRAINT fk_eventreport_itemorgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_eventreport_itemorgunitunitgroups_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_itemorgunitgroups
    ADD CONSTRAINT fk_eventreport_itemorgunitunitgroups_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_organisationunits_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_organisationunits
    ADD CONSTRAINT fk_eventreport_organisationunits_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_organisationunits
    ADD CONSTRAINT fk_eventreport_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_eventreport_orgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_orgunitgroups
    ADD CONSTRAINT fk_eventreport_orgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_eventreport_orgunitlevels_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_orgunitlevels
    ADD CONSTRAINT fk_eventreport_orgunitlevels_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_orgunitunitgroups_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_orgunitgroups
    ADD CONSTRAINT fk_eventreport_orgunitunitgroups_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_periods_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_periods
    ADD CONSTRAINT fk_eventreport_periods_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_periods_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_periods
    ADD CONSTRAINT fk_eventreport_periods_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_eventreport_prindicatordimensions_prindicatordimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_programindicatordimensions
    ADD CONSTRAINT fk_eventreport_prindicatordimensions_prindicatordimensionid FOREIGN KEY (trackedentityprogramindicatordimensionid) REFERENCES trackedentityprogramindicatordimension(trackedentityprogramindicatordimensionid);


--
-- Name: fk_eventreport_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT fk_eventreport_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_eventreport_programindicatordimensions_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_programindicatordimensions
    ADD CONSTRAINT fk_eventreport_programindicatordimensions_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT fk_eventreport_programstageid FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_eventreport_relativeperiodsid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT fk_eventreport_relativeperiodsid FOREIGN KEY (relativeperiodsid) REFERENCES relativeperiods(relativeperiodsid);


--
-- Name: fk_eventreport_rows_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport_rows
    ADD CONSTRAINT fk_eventreport_rows_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT fk_eventreport_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_expression_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY expressiondataelement
    ADD CONSTRAINT fk_expression_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_expression_sampleelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY expressionsampleelement
    ADD CONSTRAINT fk_expression_sampleelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_expressiondataelement_expressionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY expressiondataelement
    ADD CONSTRAINT fk_expressiondataelement_expressionid FOREIGN KEY (expressionid) REFERENCES expression(expressionid);


--
-- Name: fk_expressionsampleelement_expressionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY expressionsampleelement
    ADD CONSTRAINT fk_expressionsampleelement_expressionid FOREIGN KEY (expressionid) REFERENCES expression(expressionid);


--
-- Name: fk_externalmaplayer_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY externalmaplayer
    ADD CONSTRAINT fk_externalmaplayer_legendsetid FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_externalmaplayer_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY externalmaplayer
    ADD CONSTRAINT fk_externalmaplayer_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_fileresource_externalfileresource; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY externalfileresource
    ADD CONSTRAINT fk_fileresource_externalfileresource FOREIGN KEY (fileresourceid) REFERENCES fileresource(fileresourceid);


--
-- Name: fk_fileresource_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY fileresource
    ADD CONSTRAINT fk_fileresource_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_fk_users_catconstraints_dataelementcategoryid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY users_catdimensionconstraints
    ADD CONSTRAINT fk_fk_users_catconstraints_dataelementcategoryid FOREIGN KEY (dataelementcategoryid) REFERENCES dataelementcategory(categoryid);


--
-- Name: fk_fk_users_cogsconstraints_categoryoptiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY users_cogsdimensionconstraints
    ADD CONSTRAINT fk_fk_users_cogsconstraints_categoryoptiongroupsetid FOREIGN KEY (categoryoptiongroupsetid) REFERENCES categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: fk_indicator_indicatortypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicator
    ADD CONSTRAINT fk_indicator_indicatortypeid FOREIGN KEY (indicatortypeid) REFERENCES indicatortype(indicatortypeid);


--
-- Name: fk_indicator_legendset; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicator
    ADD CONSTRAINT fk_indicator_legendset FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_indicator_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicator
    ADD CONSTRAINT fk_indicator_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_indicatorgroup_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupmembers
    ADD CONSTRAINT fk_indicatorgroup_indicatorid FOREIGN KEY (indicatorid) REFERENCES indicator(indicatorid);


--
-- Name: fk_indicatorgroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroup
    ADD CONSTRAINT fk_indicatorgroup_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_indicatorgroupmembers_indicatorgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupmembers
    ADD CONSTRAINT fk_indicatorgroupmembers_indicatorgroupid FOREIGN KEY (indicatorgroupid) REFERENCES indicatorgroup(indicatorgroupid);


--
-- Name: fk_indicatorgroupset_indicatorgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupsetmembers
    ADD CONSTRAINT fk_indicatorgroupset_indicatorgroupid FOREIGN KEY (indicatorgroupid) REFERENCES indicatorgroup(indicatorgroupid);


--
-- Name: fk_indicatorgroupset_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupset
    ADD CONSTRAINT fk_indicatorgroupset_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_indicatorgroupsetmembers_indicatorgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupsetmembers
    ADD CONSTRAINT fk_indicatorgroupsetmembers_indicatorgroupsetid FOREIGN KEY (indicatorgroupsetid) REFERENCES indicatorgroupset(indicatorgroupsetid);


--
-- Name: fk_intepretation_likedby_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY intepretation_likedby
    ADD CONSTRAINT fk_intepretation_likedby_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_interpretation_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT fk_interpretation_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_interpretation_comments_interpretationcommentid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY interpretation_comments
    ADD CONSTRAINT fk_interpretation_comments_interpretationcommentid FOREIGN KEY (interpretationcommentid) REFERENCES interpretationcomment(interpretationcommentid);


--
-- Name: fk_interpretation_comments_interpretationid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY interpretation_comments
    ADD CONSTRAINT fk_interpretation_comments_interpretationid FOREIGN KEY (interpretationid) REFERENCES interpretation(interpretationid);


--
-- Name: fk_interpretation_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT fk_interpretation_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_interpretation_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT fk_interpretation_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_interpretation_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT fk_interpretation_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_interpretation_likedby_interpretationid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY intepretation_likedby
    ADD CONSTRAINT fk_interpretation_likedby_interpretationid FOREIGN KEY (interpretationid) REFERENCES interpretation(interpretationid);


--
-- Name: fk_interpretation_mapid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT fk_interpretation_mapid FOREIGN KEY (mapid) REFERENCES map(mapid);


--
-- Name: fk_interpretation_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT fk_interpretation_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_interpretation_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT fk_interpretation_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_interpretation_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT fk_interpretation_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_interpretation_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT fk_interpretation_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_interpretationcomment_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY interpretationcomment
    ADD CONSTRAINT fk_interpretationcomment_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_jphesprogramdataelementgroup; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_program
    ADD CONSTRAINT fk_jphesprogramdataelementgroup FOREIGN KEY (dataelementgroupid) REFERENCES dataelementgroup(dataelementgroupid);


--
-- Name: fk_jphesprogramindicatorgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_program
    ADD CONSTRAINT fk_jphesprogramindicatorgroupid FOREIGN KEY (indicatorgroupid) REFERENCES indicatorgroup(indicatorgroupid);


--
-- Name: fk_legendset_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY maplegendset
    ADD CONSTRAINT fk_legendset_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_lockexception_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY lockexception
    ADD CONSTRAINT fk_lockexception_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_lockexception_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY lockexception
    ADD CONSTRAINT fk_lockexception_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_lockexception_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY lockexception
    ADD CONSTRAINT fk_lockexception_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_maplegendset_maplegend; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY maplegendsetmaplegend
    ADD CONSTRAINT fk_maplegendset_maplegend FOREIGN KEY (maplegendid) REFERENCES maplegend(maplegendid);


--
-- Name: fk_maplegendsetmaplegend_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY maplegendsetmaplegend
    ADD CONSTRAINT fk_maplegendsetmaplegend_legendsetid FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_mapmapview_mapid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapmapviews
    ADD CONSTRAINT fk_mapmapview_mapid FOREIGN KEY (mapid) REFERENCES map(mapid);


--
-- Name: fk_mapmapview_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapmapviews
    ADD CONSTRAINT fk_mapmapview_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_mapview_attributedimensions_attributedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_attributedimensions
    ADD CONSTRAINT fk_mapview_attributedimensions_attributedimensionid FOREIGN KEY (trackedentityattributedimensionid) REFERENCES trackedentityattributedimension(trackedentityattributedimensionid);


--
-- Name: fk_mapview_attributedimensions_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_attributedimensions
    ADD CONSTRAINT fk_mapview_attributedimensions_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_mapview_columns_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_columns
    ADD CONSTRAINT fk_mapview_columns_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_mapview_datadimensionitems_datadimensionitemid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_datadimensionitems
    ADD CONSTRAINT fk_mapview_datadimensionitems_datadimensionitemid FOREIGN KEY (datadimensionitemid) REFERENCES datadimensionitem(datadimensionitemid);


--
-- Name: fk_mapview_datadimensionitems_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_datadimensionitems
    ADD CONSTRAINT fk_mapview_datadimensionitems_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_mapview_dataelementdimensions_dataelementdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_dataelementdimensions
    ADD CONSTRAINT fk_mapview_dataelementdimensions_dataelementdimensionid FOREIGN KEY (trackedentitydataelementdimensionid) REFERENCES trackedentitydataelementdimension(trackedentitydataelementdimensionid);


--
-- Name: fk_mapview_dataelementdimensions_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_dataelementdimensions
    ADD CONSTRAINT fk_mapview_dataelementdimensions_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_mapview_itemorgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_itemorgunitgroups
    ADD CONSTRAINT fk_mapview_itemorgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_mapview_itemorgunitunitgroups_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_itemorgunitgroups
    ADD CONSTRAINT fk_mapview_itemorgunitunitgroups_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_mapview_maplegendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview
    ADD CONSTRAINT fk_mapview_maplegendsetid FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_mapview_organisationunits_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_organisationunits
    ADD CONSTRAINT fk_mapview_organisationunits_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_mapview_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_organisationunits
    ADD CONSTRAINT fk_mapview_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_mapview_orgunitgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview
    ADD CONSTRAINT fk_mapview_orgunitgroupsetid FOREIGN KEY (orgunitgroupsetid) REFERENCES orgunitgroupset(orgunitgroupsetid);


--
-- Name: fk_mapview_orgunitlevels_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_orgunitlevels
    ADD CONSTRAINT fk_mapview_orgunitlevels_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_mapview_periods_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_periods
    ADD CONSTRAINT fk_mapview_periods_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_mapview_periods_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview_periods
    ADD CONSTRAINT fk_mapview_periods_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_mapview_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview
    ADD CONSTRAINT fk_mapview_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_mapview_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview
    ADD CONSTRAINT fk_mapview_programstageid FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_mapview_relativeperiodsid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapview
    ADD CONSTRAINT fk_mapview_relativeperiodsid FOREIGN KEY (relativeperiodsid) REFERENCES relativeperiods(relativeperiodsid);


--
-- Name: fk_mapview_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY map
    ADD CONSTRAINT fk_mapview_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_mechanismunit_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_mechanismunit
    ADD CONSTRAINT fk_mechanismunit_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_mechanismunitagencyid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_mechanismunit
    ADD CONSTRAINT fk_mechanismunitagencyid FOREIGN KEY (agencyunitid) REFERENCES jphes_agencyunit(agencyunitid);


--
-- Name: fk_mechanismunitcategoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_mechanismunit
    ADD CONSTRAINT fk_mechanismunitcategoryoptionid FOREIGN KEY (categoryoptionid) REFERENCES dataelementcategoryoption(categoryoptionid);


--
-- Name: fk_mechanismunitprograms_mechanismunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_mechanismunitprograms
    ADD CONSTRAINT fk_mechanismunitprograms_mechanismunitid FOREIGN KEY (mechanismunitid) REFERENCES jphes_mechanismunit(mechanismunitid);


--
-- Name: fk_mechanismunitprograms_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_mechanismunitprograms
    ADD CONSTRAINT fk_mechanismunitprograms_programid FOREIGN KEY (programid) REFERENCES jphes_program(programid);


--
-- Name: fk_mechanismunitusergroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_mechanismunit
    ADD CONSTRAINT fk_mechanismunitusergroupid FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_message_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY message
    ADD CONSTRAINT fk_message_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_messageconversation_lastsender_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY messageconversation
    ADD CONSTRAINT fk_messageconversation_lastsender_userid FOREIGN KEY (lastsenderid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_messageconversation_messages_messageconversationid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY messageconversation_messages
    ADD CONSTRAINT fk_messageconversation_messages_messageconversationid FOREIGN KEY (messageconversationid) REFERENCES messageconversation(messageconversationid);


--
-- Name: fk_messageconversation_messages_messageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY messageconversation_messages
    ADD CONSTRAINT fk_messageconversation_messages_messageid FOREIGN KEY (messageid) REFERENCES message(messageid);


--
-- Name: fk_messageconversation_user_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY messageconversation
    ADD CONSTRAINT fk_messageconversation_user_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_messageconversation_usermessages_messageconversationid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY messageconversation_usermessages
    ADD CONSTRAINT fk_messageconversation_usermessages_messageconversationid FOREIGN KEY (messageconversationid) REFERENCES messageconversation(messageconversationid);


--
-- Name: fk_messageconversation_usermessages_usermessageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY messageconversation_usermessages
    ADD CONSTRAINT fk_messageconversation_usermessages_usermessageid FOREIGN KEY (usermessageid) REFERENCES usermessage(usermessageid);


--
-- Name: fk_minmaxdataelement_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY minmaxdataelement
    ADD CONSTRAINT fk_minmaxdataelement_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_minmaxdataelement_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY minmaxdataelement
    ADD CONSTRAINT fk_minmaxdataelement_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_minmaxdataelement_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY minmaxdataelement
    ADD CONSTRAINT fk_minmaxdataelement_organisationunitid FOREIGN KEY (sourceid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_nationalunit_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_nationalunit
    ADD CONSTRAINT fk_nationalunit_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_nationalunitcategorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_nationalunit
    ADD CONSTRAINT fk_nationalunitcategorycomboid FOREIGN KEY (categorycomboid) REFERENCES categorycombo(categorycomboid);


--
-- Name: fk_nationalunitcategoryid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_nationalunit
    ADD CONSTRAINT fk_nationalunitcategoryid FOREIGN KEY (categoryid) REFERENCES dataelementcategory(categoryid);


--
-- Name: fk_nationalunitcategoryoptiongroupsetdonorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_nationalunit
    ADD CONSTRAINT fk_nationalunitcategoryoptiongroupsetdonorid FOREIGN KEY (categoryoptiongroupsetdonorid) REFERENCES categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: fk_nationalunitdonorunits_donorunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_nationalunitdonorunits
    ADD CONSTRAINT fk_nationalunitdonorunits_donorunitid FOREIGN KEY (donorunitid) REFERENCES jphes_donorunit(donorunitid);


--
-- Name: fk_nationalunitdonorunits_nationalunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_nationalunitdonorunits
    ADD CONSTRAINT fk_nationalunitdonorunits_nationalunitid FOREIGN KEY (nationalunitid) REFERENCES jphes_nationalunit(nationalunitid);


--
-- Name: fk_nationalunitprograms_nationalunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_nationalunitprograms
    ADD CONSTRAINT fk_nationalunitprograms_nationalunitid FOREIGN KEY (nationalunitid) REFERENCES jphes_nationalunit(nationalunitid);


--
-- Name: fk_nationalunitprograms_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_nationalunitprograms
    ADD CONSTRAINT fk_nationalunitprograms_programid FOREIGN KEY (programid) REFERENCES jphes_program(programid);


--
-- Name: fk_nationalunitusergroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_nationalunit
    ADD CONSTRAINT fk_nationalunitusergroupid FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_oauth2clientgranttypes_oauth2clientid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY oauth2clientgranttypes
    ADD CONSTRAINT fk_oauth2clientgranttypes_oauth2clientid FOREIGN KEY (oauth2clientid) REFERENCES oauth2client(oauth2clientid);


--
-- Name: fk_oauth2clientredirecturis_oauth2clientid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY oauth2clientredirecturis
    ADD CONSTRAINT fk_oauth2clientredirecturis_oauth2clientid FOREIGN KEY (oauth2clientid) REFERENCES oauth2client(oauth2clientid);


--
-- Name: fk_objecttranslation_attributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY attributetranslations
    ADD CONSTRAINT fk_objecttranslation_attributeid FOREIGN KEY (attributeid) REFERENCES attribute(attributeid);


--
-- Name: fk_objecttranslation_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorycombotranslations
    ADD CONSTRAINT fk_objecttranslation_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES categorycombo(categorycomboid);


--
-- Name: fk_objecttranslation_categoryid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategorytranslations
    ADD CONSTRAINT fk_objecttranslation_categoryid FOREIGN KEY (categoryid) REFERENCES dataelementcategory(categoryid);


--
-- Name: fk_objecttranslation_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptioncombotranslations
    ADD CONSTRAINT fk_objecttranslation_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_objecttranslation_categoryoptiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongrouptranslations
    ADD CONSTRAINT fk_objecttranslation_categoryoptiongroupid FOREIGN KEY (categoryoptiongroupid) REFERENCES categoryoptiongroup(categoryoptiongroupid);


--
-- Name: fk_objecttranslation_categoryoptiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupsettranslations
    ADD CONSTRAINT fk_objecttranslation_categoryoptiongroupsetid FOREIGN KEY (categoryoptiongroupsetid) REFERENCES categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: fk_objecttranslation_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiontranslations
    ADD CONSTRAINT fk_objecttranslation_categoryoptionid FOREIGN KEY (categoryoptionid) REFERENCES dataelementcategoryoption(categoryoptionid);


--
-- Name: fk_objecttranslation_chartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY charttranslations
    ADD CONSTRAINT fk_objecttranslation_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_objecttranslation_colorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY colortranslations
    ADD CONSTRAINT fk_objecttranslation_colorid FOREIGN KEY (colorid) REFERENCES color(colorid);


--
-- Name: fk_objecttranslation_colorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY constanttranslations
    ADD CONSTRAINT fk_objecttranslation_colorid FOREIGN KEY (colorid) REFERENCES constant(constantid);


--
-- Name: fk_objecttranslation_colorsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY colorsettranslations
    ADD CONSTRAINT fk_objecttranslation_colorsetid FOREIGN KEY (colorsetid) REFERENCES colorset(colorsetid);


--
-- Name: fk_objecttranslation_dashboardid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboardtranslations
    ADD CONSTRAINT fk_objecttranslation_dashboardid FOREIGN KEY (dashboardid) REFERENCES dashboard(dashboardid);


--
-- Name: fk_objecttranslation_dashboarditemid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditemtranslations
    ADD CONSTRAINT fk_objecttranslation_dashboarditemid FOREIGN KEY (dashboarditemid) REFERENCES dashboarditem(dashboarditemid);


--
-- Name: fk_objecttranslation_dataapprovallevelid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovalleveltranslations
    ADD CONSTRAINT fk_objecttranslation_dataapprovallevelid FOREIGN KEY (dataapprovallevelid) REFERENCES dataapprovallevel(dataapprovallevelid);


--
-- Name: fk_objecttranslation_dataelementgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgrouptranslations
    ADD CONSTRAINT fk_objecttranslation_dataelementgroupid FOREIGN KEY (dataelementgroupid) REFERENCES dataelementgroup(dataelementgroupid);


--
-- Name: fk_objecttranslation_dataelementgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupsettranslations
    ADD CONSTRAINT fk_objecttranslation_dataelementgroupsetid FOREIGN KEY (dataelementgroupsetid) REFERENCES dataelementgroupset(dataelementgroupsetid);


--
-- Name: fk_objecttranslation_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementtranslations
    ADD CONSTRAINT fk_objecttranslation_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_objecttranslation_dataentryformid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataentryformtranslations
    ADD CONSTRAINT fk_objecttranslation_dataentryformid FOREIGN KEY (dataentryformid) REFERENCES dataentryform(dataentryformid);


--
-- Name: fk_objecttranslation_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasettranslations
    ADD CONSTRAINT fk_objecttranslation_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_objecttranslation_documentid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY documenttranslations
    ADD CONSTRAINT fk_objecttranslation_documentid FOREIGN KEY (documentid) REFERENCES document(documentid);


--
-- Name: fk_objecttranslation_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventcharttranslations
    ADD CONSTRAINT fk_objecttranslation_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_objecttranslation_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreporttranslations
    ADD CONSTRAINT fk_objecttranslation_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_objecttranslation_indicatorgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgrouptranslations
    ADD CONSTRAINT fk_objecttranslation_indicatorgroupid FOREIGN KEY (indicatorgroupid) REFERENCES indicatorgroup(indicatorgroupid);


--
-- Name: fk_objecttranslation_indicatorgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupsettranslations
    ADD CONSTRAINT fk_objecttranslation_indicatorgroupsetid FOREIGN KEY (indicatorgroupsetid) REFERENCES indicatorgroupset(indicatorgroupsetid);


--
-- Name: fk_objecttranslation_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatortranslations
    ADD CONSTRAINT fk_objecttranslation_indicatorid FOREIGN KEY (indicatorid) REFERENCES indicator(indicatorid);


--
-- Name: fk_objecttranslation_indicatortypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatortypetranslations
    ADD CONSTRAINT fk_objecttranslation_indicatortypeid FOREIGN KEY (indicatortypeid) REFERENCES indicatortype(indicatortypeid);


--
-- Name: fk_objecttranslation_maplegendid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY maplegendtranslations
    ADD CONSTRAINT fk_objecttranslation_maplegendid FOREIGN KEY (maplegendid) REFERENCES maplegend(maplegendid);


--
-- Name: fk_objecttranslation_maplegendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY maplegendsettranslations
    ADD CONSTRAINT fk_objecttranslation_maplegendsetid FOREIGN KEY (maplegendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_objecttranslation_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapviewtranslations
    ADD CONSTRAINT fk_objecttranslation_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_objecttranslation_optiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongrouptranslations
    ADD CONSTRAINT fk_objecttranslation_optiongroupid FOREIGN KEY (optiongroupid) REFERENCES optiongroup(optiongroupid);


--
-- Name: fk_objecttranslation_optiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupsettranslations
    ADD CONSTRAINT fk_objecttranslation_optiongroupsetid FOREIGN KEY (optiongroupsetid) REFERENCES optiongroupset(optiongroupsetid);


--
-- Name: fk_objecttranslation_optionsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionsettranslations
    ADD CONSTRAINT fk_objecttranslation_optionsetid FOREIGN KEY (optionsetid) REFERENCES optionset(optionsetid);


--
-- Name: fk_objecttranslation_optionvalueid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionvaluetranslations
    ADD CONSTRAINT fk_objecttranslation_optionvalueid FOREIGN KEY (optionvalueid) REFERENCES optionvalue(optionvalueid);


--
-- Name: fk_objecttranslation_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY organisationunittranslations
    ADD CONSTRAINT fk_objecttranslation_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_objecttranslation_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgrouptranslations
    ADD CONSTRAINT fk_objecttranslation_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_objecttranslation_orgunitgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupsettranslations
    ADD CONSTRAINT fk_objecttranslation_orgunitgroupsetid FOREIGN KEY (orgunitgroupsetid) REFERENCES orgunitgroupset(orgunitgroupsetid);


--
-- Name: fk_objecttranslation_orgunitlevelid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitleveltranslations
    ADD CONSTRAINT fk_objecttranslation_orgunitlevelid FOREIGN KEY (orgunitlevelid) REFERENCES orgunitlevel(orgunitlevelid);


--
-- Name: fk_objecttranslation_programdataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programdataelementtranslations
    ADD CONSTRAINT fk_objecttranslation_programdataelementid FOREIGN KEY (programdataelementid) REFERENCES programdataelement(programdataelementid);


--
-- Name: fk_objecttranslation_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programtranslations
    ADD CONSTRAINT fk_objecttranslation_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_objecttranslation_programindicatorgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorgrouptranslations
    ADD CONSTRAINT fk_objecttranslation_programindicatorgroupid FOREIGN KEY (programindicatorgroupid) REFERENCES programindicatorgroup(programindicatorgroupid);


--
-- Name: fk_objecttranslation_programindicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatortranslations
    ADD CONSTRAINT fk_objecttranslation_programindicatorid FOREIGN KEY (programindicatorid) REFERENCES programindicator(programindicatorid);


--
-- Name: fk_objecttranslation_programmessageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programmessagetranslations
    ADD CONSTRAINT fk_objecttranslation_programmessageid FOREIGN KEY (id) REFERENCES programmessage(id);


--
-- Name: fk_objecttranslation_programruleid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programruletranslations
    ADD CONSTRAINT fk_objecttranslation_programruleid FOREIGN KEY (programruleid) REFERENCES programrule(programruleid);


--
-- Name: fk_objecttranslation_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagetranslations
    ADD CONSTRAINT fk_objecttranslation_programstageid FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_objecttranslation_programstagesectionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagesectiontranslations
    ADD CONSTRAINT fk_objecttranslation_programstagesectionid FOREIGN KEY (programstagesectionid) REFERENCES programstagesection(programstagesectionid);


--
-- Name: fk_objecttranslation_programvalidationid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programvalidationtranslations
    ADD CONSTRAINT fk_objecttranslation_programvalidationid FOREIGN KEY (programvalidationid) REFERENCES programvalidation(programvalidationid);


--
-- Name: fk_objecttranslation_relationshiptypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY relationshiptypetranslations
    ADD CONSTRAINT fk_objecttranslation_relationshiptypeid FOREIGN KEY (relationshiptypeid) REFERENCES relationshiptype(relationshiptypeid);


--
-- Name: fk_objecttranslation_reportid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttranslations
    ADD CONSTRAINT fk_objecttranslation_reportid FOREIGN KEY (reportid) REFERENCES report(reportid);


--
-- Name: fk_objecttranslation_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttabletranslations
    ADD CONSTRAINT fk_objecttranslation_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_objecttranslation_sectionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetsectiontranslations
    ADD CONSTRAINT fk_objecttranslation_sectionid FOREIGN KEY (sectionid) REFERENCES section(sectionid);


--
-- Name: fk_objecttranslation_trackedentityattributegroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributegrouptranslations
    ADD CONSTRAINT fk_objecttranslation_trackedentityattributegroupid FOREIGN KEY (trackedentityattributegroupid) REFERENCES trackedentityattributegroup(trackedentityattributegroupid);


--
-- Name: fk_objecttranslation_trackedentityattributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributetranslations
    ADD CONSTRAINT fk_objecttranslation_trackedentityattributeid FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_objecttranslation_trackedentityid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentitytranslations
    ADD CONSTRAINT fk_objecttranslation_trackedentityid FOREIGN KEY (trackedentityid) REFERENCES trackedentity(trackedentityid);


--
-- Name: fk_objecttranslation_usergroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergrouptranslations
    ADD CONSTRAINT fk_objecttranslation_usergroupid FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_objecttranslation_userroleid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userroletranslations
    ADD CONSTRAINT fk_objecttranslation_userroleid FOREIGN KEY (userroleid) REFERENCES userrole(userroleid);


--
-- Name: fk_objecttranslation_validationcriteriaid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationcriteriatranslations
    ADD CONSTRAINT fk_objecttranslation_validationcriteriaid FOREIGN KEY (validationcriteriaid) REFERENCES validationcriteria(validationcriteriaid);


--
-- Name: fk_objecttranslation_validationrulegroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrulegrouptranslations
    ADD CONSTRAINT fk_objecttranslation_validationrulegroupid FOREIGN KEY (validationrulegroupid) REFERENCES validationrulegroup(validationrulegroupid);


--
-- Name: fk_objecttranslation_validationruleid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationruletranslations
    ADD CONSTRAINT fk_objecttranslation_validationruleid FOREIGN KEY (validationruleid) REFERENCES validationrule(validationruleid);


--
-- Name: fk_objecttranslation_workflowid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovalworkflowtranslations
    ADD CONSTRAINT fk_objecttranslation_workflowid FOREIGN KEY (workflowid) REFERENCES dataapprovalworkflow(workflowid);


--
-- Name: fk_optiongroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroup
    ADD CONSTRAINT fk_optiongroup_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_optiongroupmembers_optiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupmembers
    ADD CONSTRAINT fk_optiongroupmembers_optiongroupid FOREIGN KEY (optionid) REFERENCES optionvalue(optionvalueid);


--
-- Name: fk_optiongroupmembers_optionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupmembers
    ADD CONSTRAINT fk_optiongroupmembers_optionid FOREIGN KEY (optiongroupid) REFERENCES optiongroup(optiongroupid);


--
-- Name: fk_optiongroupset_optionsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupset
    ADD CONSTRAINT fk_optiongroupset_optionsetid FOREIGN KEY (optionsetid) REFERENCES optionset(optionsetid);


--
-- Name: fk_optiongroupset_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupset
    ADD CONSTRAINT fk_optiongroupset_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_optiongroupsetmembers_optiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupsetmembers
    ADD CONSTRAINT fk_optiongroupsetmembers_optiongroupid FOREIGN KEY (optiongroupid) REFERENCES optiongroup(optiongroupid);


--
-- Name: fk_optiongroupsetmembers_optiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupsetmembers
    ADD CONSTRAINT fk_optiongroupsetmembers_optiongroupsetid FOREIGN KEY (optiongroupsetid) REFERENCES optiongroupset(optiongroupsetid);


--
-- Name: fk_optionset_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionset
    ADD CONSTRAINT fk_optionset_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_optionsetmembers_optionsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_optionsetmembers_optionsetid FOREIGN KEY (optionsetid) REFERENCES optionset(optionsetid);


--
-- Name: fk_organisationunit_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY organisationunit
    ADD CONSTRAINT fk_organisationunit_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_orgunitgroup_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupmembers
    ADD CONSTRAINT fk_orgunitgroup_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_orgunitgroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroup
    ADD CONSTRAINT fk_orgunitgroup_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_orgunitgroupmembers_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupmembers
    ADD CONSTRAINT fk_orgunitgroupmembers_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_orgunitgroupset_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupsetmembers
    ADD CONSTRAINT fk_orgunitgroupset_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_orgunitgroupset_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupset
    ADD CONSTRAINT fk_orgunitgroupset_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_orgunitgroupsetmembers_orgunitgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupsetmembers
    ADD CONSTRAINT fk_orgunitgroupsetmembers_orgunitgroupsetid FOREIGN KEY (orgunitgroupsetid) REFERENCES orgunitgroupset(orgunitgroupsetid);


--
-- Name: fk_parentid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY organisationunit
    ADD CONSTRAINT fk_parentid FOREIGN KEY (parentid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_period_periodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY period
    ADD CONSTRAINT fk_period_periodtypeid FOREIGN KEY (periodtypeid) REFERENCES periodtype(periodtypeid);


--
-- Name: fk_predictor_generatorexpressionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY predictor
    ADD CONSTRAINT fk_predictor_generatorexpressionid FOREIGN KEY (generatorexpressionid) REFERENCES expression(expressionid);


--
-- Name: fk_predictor_outputcomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY predictor
    ADD CONSTRAINT fk_predictor_outputcomboid FOREIGN KEY (generatoroutputcombo) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_predictor_outputdataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY predictor
    ADD CONSTRAINT fk_predictor_outputdataelementid FOREIGN KEY (generatoroutput) REFERENCES dataelement(dataelementid);


--
-- Name: fk_predictororgunitlevels_orgunitlevelid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY predictororgunitlevels
    ADD CONSTRAINT fk_predictororgunitlevels_orgunitlevelid FOREIGN KEY (orgunitlevelid) REFERENCES orgunitlevel(orgunitlevelid);


--
-- Name: fk_predictororgunitlevels_predictorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY predictororgunitlevels
    ADD CONSTRAINT fk_predictororgunitlevels_predictorid FOREIGN KEY (predictorid) REFERENCES predictor(predictorid);


--
-- Name: fk_program_attributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program_attributes
    ADD CONSTRAINT fk_program_attributeid FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_program_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program
    ADD CONSTRAINT fk_program_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES categorycombo(categorycomboid);


--
-- Name: fk_program_criteria_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program_criteria
    ADD CONSTRAINT fk_program_criteria_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_program_criteria_validationcriteriaid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program_criteria
    ADD CONSTRAINT fk_program_criteria_validationcriteriaid FOREIGN KEY (validationcriteriaid) REFERENCES validationcriteria(validationcriteriaid);


--
-- Name: fk_program_dataentryformid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program
    ADD CONSTRAINT fk_program_dataentryformid FOREIGN KEY (dataentryformid) REFERENCES dataentryform(dataentryformid);


--
-- Name: fk_program_expiryperiodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program
    ADD CONSTRAINT fk_program_expiryperiodtypeid FOREIGN KEY (expiryperiodtypeid) REFERENCES periodtype(periodtypeid);


--
-- Name: fk_program_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program_organisationunits
    ADD CONSTRAINT fk_program_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_program_organisationunits_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program_organisationunits
    ADD CONSTRAINT fk_program_organisationunits_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_program_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagesection
    ADD CONSTRAINT fk_program_programstageid FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_program_relatedprogram; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program
    ADD CONSTRAINT fk_program_relatedprogram FOREIGN KEY (relatedprogramid) REFERENCES program(programid);


--
-- Name: fk_program_relationshipid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program
    ADD CONSTRAINT fk_program_relationshipid FOREIGN KEY (relationshiptypeid) REFERENCES relationshiptype(relationshiptypeid);


--
-- Name: fk_program_trackedentityid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program
    ADD CONSTRAINT fk_program_trackedentityid FOREIGN KEY (trackedentityid) REFERENCES trackedentity(trackedentityid);


--
-- Name: fk_program_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program
    ADD CONSTRAINT fk_program_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_program_userroles; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program_userroles
    ADD CONSTRAINT fk_program_userroles FOREIGN KEY (userroleid) REFERENCES userrole(userroleid);


--
-- Name: fk_program_workflowid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program
    ADD CONSTRAINT fk_program_workflowid FOREIGN KEY (workflowid) REFERENCES dataapprovalworkflow(workflowid);


--
-- Name: fk_programdataelement_dataelement; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programdataelement
    ADD CONSTRAINT fk_programdataelement_dataelement FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_programdataelement_program; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programdataelement
    ADD CONSTRAINT fk_programdataelement_program FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_programdataelements_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_programdataelements
    ADD CONSTRAINT fk_programdataelements_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_programdataelements_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_programdataelements
    ADD CONSTRAINT fk_programdataelements_programid FOREIGN KEY (programid) REFERENCES jphes_program(programid);


--
-- Name: fk_programindicator_legendset; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicator
    ADD CONSTRAINT fk_programindicator_legendset FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_programindicator_program; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicator
    ADD CONSTRAINT fk_programindicator_program FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_programindicator_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicator
    ADD CONSTRAINT fk_programindicator_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_programindicatorgroup_programindicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorgroupmembers
    ADD CONSTRAINT fk_programindicatorgroup_programindicatorid FOREIGN KEY (programindicatorid) REFERENCES programindicator(programindicatorid);


--
-- Name: fk_programindicatorgroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorgroup
    ADD CONSTRAINT fk_programindicatorgroup_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_programindicatorgroupmembers_programindicatorgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorgroupmembers
    ADD CONSTRAINT fk_programindicatorgroupmembers_programindicatorgroupid FOREIGN KEY (programindicatorgroupid) REFERENCES programindicatorgroup(programindicatorgroupid);


--
-- Name: fk_programindicators_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_programindicators
    ADD CONSTRAINT fk_programindicators_indicatorid FOREIGN KEY (indicatorid) REFERENCES indicator(indicatorid);


--
-- Name: fk_programindicators_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY jphes_programindicators
    ADD CONSTRAINT fk_programindicators_programid FOREIGN KEY (programid) REFERENCES jphes_program(programid);


--
-- Name: fk_programinstance_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programinstance
    ADD CONSTRAINT fk_programinstance_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_programinstance_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programinstance
    ADD CONSTRAINT fk_programinstance_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_programinstance_trackedentityinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programinstance
    ADD CONSTRAINT fk_programinstance_trackedentityinstanceid FOREIGN KEY (trackedentityinstanceid) REFERENCES trackedentityinstance(trackedentityinstanceid);


--
-- Name: fk_programinstancecomments_programinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programinstancecomments
    ADD CONSTRAINT fk_programinstancecomments_programinstanceid FOREIGN KEY (programinstanceid) REFERENCES programinstance(programinstanceid);


--
-- Name: fk_programinstancecomments_trackedentitycommentid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programinstancecomments
    ADD CONSTRAINT fk_programinstancecomments_trackedentitycommentid FOREIGN KEY (trackedentitycommentid) REFERENCES trackedentitycomment(trackedentitycommentid);


--
-- Name: fk_programmessage_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programmessage
    ADD CONSTRAINT fk_programmessage_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_programmessage_programinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programmessage
    ADD CONSTRAINT fk_programmessage_programinstanceid FOREIGN KEY (programinstanceid) REFERENCES programinstance(programinstanceid);


--
-- Name: fk_programmessage_programstageinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programmessage
    ADD CONSTRAINT fk_programmessage_programstageinstanceid FOREIGN KEY (programstageinstanceid) REFERENCES programstageinstance(programstageinstanceid);


--
-- Name: fk_programmessage_trackedentityinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programmessage
    ADD CONSTRAINT fk_programmessage_trackedentityinstanceid FOREIGN KEY (trackedentityinstanceid) REFERENCES trackedentityinstance(trackedentityinstanceid);


--
-- Name: fk_programrule_program; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programrule
    ADD CONSTRAINT fk_programrule_program FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_programrule_programstage; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programrule
    ADD CONSTRAINT fk_programrule_programstage FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_programruleaction_dataelement; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programruleaction
    ADD CONSTRAINT fk_programruleaction_dataelement FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_programruleaction_programindicator; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programruleaction
    ADD CONSTRAINT fk_programruleaction_programindicator FOREIGN KEY (programindicatorid) REFERENCES programindicator(programindicatorid);


--
-- Name: fk_programruleaction_programrule; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programruleaction
    ADD CONSTRAINT fk_programruleaction_programrule FOREIGN KEY (programruleid) REFERENCES programrule(programruleid);


--
-- Name: fk_programruleaction_programstage; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programruleaction
    ADD CONSTRAINT fk_programruleaction_programstage FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_programruleaction_programstagesection; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programruleaction
    ADD CONSTRAINT fk_programruleaction_programstagesection FOREIGN KEY (programstagesectionid) REFERENCES programstagesection(programstagesectionid);


--
-- Name: fk_programruleaction_trackedentityattribute; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programruleaction
    ADD CONSTRAINT fk_programruleaction_trackedentityattribute FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_programrulevariable_dataelement; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programrulevariable
    ADD CONSTRAINT fk_programrulevariable_dataelement FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_programrulevariable_program; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programrulevariable
    ADD CONSTRAINT fk_programrulevariable_program FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_programrulevariable_programstage; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programrulevariable
    ADD CONSTRAINT fk_programrulevariable_programstage FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_programrulevariable_trackedentityattribute; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programrulevariable
    ADD CONSTRAINT fk_programrulevariable_trackedentityattribute FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_programstage_dataentryform; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstage
    ADD CONSTRAINT fk_programstage_dataentryform FOREIGN KEY (dataentryformid) REFERENCES dataentryform(dataentryformid);


--
-- Name: fk_programstage_periodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstage
    ADD CONSTRAINT fk_programstage_periodtypeid FOREIGN KEY (periodtypeid) REFERENCES periodtype(periodtypeid);


--
-- Name: fk_programstage_program; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstage
    ADD CONSTRAINT fk_programstage_program FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_programstagedataelement_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagedataelement
    ADD CONSTRAINT fk_programstagedataelement_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_programstagedataelement_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagedataelement
    ADD CONSTRAINT fk_programstagedataelement_programstageid FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_programstageinstance_attributeoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstageinstance
    ADD CONSTRAINT fk_programstageinstance_attributeoptioncomboid FOREIGN KEY (attributeoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_programstageinstance_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstageinstance
    ADD CONSTRAINT fk_programstageinstance_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_programstageinstance_programinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstageinstance
    ADD CONSTRAINT fk_programstageinstance_programinstanceid FOREIGN KEY (programinstanceid) REFERENCES programinstance(programinstanceid);


--
-- Name: fk_programstageinstance_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstageinstance
    ADD CONSTRAINT fk_programstageinstance_programstageid FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_programstageinstancecomments_programstageinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstageinstancecomments
    ADD CONSTRAINT fk_programstageinstancecomments_programstageinstanceid FOREIGN KEY (programstageinstanceid) REFERENCES programstageinstance(programstageinstanceid);


--
-- Name: fk_programstageinstancecomments_trackedentitycommentid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstageinstancecomments
    ADD CONSTRAINT fk_programstageinstancecomments_trackedentitycommentid FOREIGN KEY (trackedentitycommentid) REFERENCES trackedentitycomment(trackedentitycommentid);


--
-- Name: fk_programstagenotification_usergroup; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programnotificationtemplate
    ADD CONSTRAINT fk_programstagenotification_usergroup FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_programstagesection_programindicators_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagesection_programindicators
    ADD CONSTRAINT fk_programstagesection_programindicators_indicatorid FOREIGN KEY (programindicatorid) REFERENCES programindicator(programindicatorid);


--
-- Name: fk_programstagesection_programindicators_sectionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagesection_programindicators
    ADD CONSTRAINT fk_programstagesection_programindicators_sectionid FOREIGN KEY (programstagesectionid) REFERENCES programstagesection(programstagesectionid);


--
-- Name: fk_programtrackedentityattribute_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program_attributes
    ADD CONSTRAINT fk_programtrackedentityattribute_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_programvalidation_leftprogramexpressionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programvalidation
    ADD CONSTRAINT fk_programvalidation_leftprogramexpressionid FOREIGN KEY (leftprogramexpressionid) REFERENCES programexpression(programexpressionid);


--
-- Name: fk_programvalidation_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programvalidation
    ADD CONSTRAINT fk_programvalidation_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_programvalidation_rightprogramexpressionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programvalidation
    ADD CONSTRAINT fk_programvalidation_rightprogramexpressionid FOREIGN KEY (rightprogramexpressionid) REFERENCES programexpression(programexpressionid);


--
-- Name: fk_pushanalysis_recipientusergroups; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY pushanalysisrecipientusergroups
    ADD CONSTRAINT fk_pushanalysis_recipientusergroups FOREIGN KEY (elt) REFERENCES usergroup(usergroupid);


--
-- Name: fk_relationship_relationshiptypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY relationship
    ADD CONSTRAINT fk_relationship_relationshiptypeid FOREIGN KEY (relationshiptypeid) REFERENCES relationshiptype(relationshiptypeid);


--
-- Name: fk_relationship_trackedentityinstanceida; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY relationship
    ADD CONSTRAINT fk_relationship_trackedentityinstanceida FOREIGN KEY (trackedentityinstanceaid) REFERENCES trackedentityinstance(trackedentityinstanceid);


--
-- Name: fk_relationship_trackedentityinstanceidb; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY relationship
    ADD CONSTRAINT fk_relationship_trackedentityinstanceidb FOREIGN KEY (trackedentityinstancebid) REFERENCES trackedentityinstance(trackedentityinstanceid);


--
-- Name: fk_report_relativeperiodsid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_report_relativeperiodsid FOREIGN KEY (relativeperiodsid) REFERENCES relativeperiods(relativeperiodsid);


--
-- Name: fk_report_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_report_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_report_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_report_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_reporttable_categorydimensions_categorydimensionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_categorydimensions
    ADD CONSTRAINT fk_reporttable_categorydimensions_categorydimensionid FOREIGN KEY (categorydimensionid) REFERENCES categorydimension(categorydimensionid);


--
-- Name: fk_reporttable_categorydimensions_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_categorydimensions
    ADD CONSTRAINT fk_reporttable_categorydimensions_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_categoryoptiongroups_categoryoptiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_categoryoptiongroups
    ADD CONSTRAINT fk_reporttable_categoryoptiongroups_categoryoptiongroupid FOREIGN KEY (categoryoptiongroupid) REFERENCES categoryoptiongroup(categoryoptiongroupid);


--
-- Name: fk_reporttable_categoryoptiongroups_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_categoryoptiongroups
    ADD CONSTRAINT fk_reporttable_categoryoptiongroups_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_columns_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_columns
    ADD CONSTRAINT fk_reporttable_columns_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_datadimensionitems_datadimensionitemid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_datadimensionitems
    ADD CONSTRAINT fk_reporttable_datadimensionitems_datadimensionitemid FOREIGN KEY (datadimensionitemid) REFERENCES datadimensionitem(datadimensionitemid);


--
-- Name: fk_reporttable_datadimensionitems_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_datadimensionitems
    ADD CONSTRAINT fk_reporttable_datadimensionitems_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_dataelementgroups_dataelementgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_dataelementgroups
    ADD CONSTRAINT fk_reporttable_dataelementgroups_dataelementgroupid FOREIGN KEY (dataelementgroupid) REFERENCES dataelementgroup(dataelementgroupid);


--
-- Name: fk_reporttable_dataelementgroups_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_dataelementgroups
    ADD CONSTRAINT fk_reporttable_dataelementgroups_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_filters_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_filters
    ADD CONSTRAINT fk_reporttable_filters_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_itemorgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_itemorgunitgroups
    ADD CONSTRAINT fk_reporttable_itemorgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_reporttable_itemorgunitunitgroups_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_itemorgunitgroups
    ADD CONSTRAINT fk_reporttable_itemorgunitunitgroups_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable
    ADD CONSTRAINT fk_reporttable_legendsetid FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_reporttable_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_organisationunits
    ADD CONSTRAINT fk_reporttable_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_reporttable_organisationunits_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_organisationunits
    ADD CONSTRAINT fk_reporttable_organisationunits_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_orgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_orgunitgroups
    ADD CONSTRAINT fk_reporttable_orgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_reporttable_orgunitlevels_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_orgunitlevels
    ADD CONSTRAINT fk_reporttable_orgunitlevels_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_orgunitunitgroups_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_orgunitgroups
    ADD CONSTRAINT fk_reporttable_orgunitunitgroups_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_periods_periodid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_periods
    ADD CONSTRAINT fk_reporttable_periods_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_reporttable_periods_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_periods
    ADD CONSTRAINT fk_reporttable_periods_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_relativeperiodsid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable
    ADD CONSTRAINT fk_reporttable_relativeperiodsid FOREIGN KEY (relativeperiodsid) REFERENCES relativeperiods(relativeperiodsid);


--
-- Name: fk_reporttable_rows_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable_rows
    ADD CONSTRAINT fk_reporttable_rows_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttable
    ADD CONSTRAINT fk_reporttable_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_section_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sectiondataelements
    ADD CONSTRAINT fk_section_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_section_dataelementoperandid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sectiongreyedfields
    ADD CONSTRAINT fk_section_dataelementoperandid FOREIGN KEY (dataelementoperandid) REFERENCES dataelementoperand(dataelementoperandid);


--
-- Name: fk_section_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY section
    ADD CONSTRAINT fk_section_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_section_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sectionindicators
    ADD CONSTRAINT fk_section_indicatorid FOREIGN KEY (indicatorid) REFERENCES indicator(indicatorid);


--
-- Name: fk_sectiondataelements_sectionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sectiondataelements
    ADD CONSTRAINT fk_sectiondataelements_sectionid FOREIGN KEY (sectionid) REFERENCES section(sectionid);


--
-- Name: fk_sectiongreyedfields_sectionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sectiongreyedfields
    ADD CONSTRAINT fk_sectiongreyedfields_sectionid FOREIGN KEY (sectionid) REFERENCES section(sectionid);


--
-- Name: fk_sectionindicators_sectionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sectionindicators
    ADD CONSTRAINT fk_sectionindicators_sectionid FOREIGN KEY (sectionid) REFERENCES section(sectionid);


--
-- Name: fk_smscommand_program; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY smscommands
    ADD CONSTRAINT fk_smscommand_program FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_smscommand_programstage; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY smscommands
    ADD CONSTRAINT fk_smscommand_programstage FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_smscommand_usergroup; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY smscommands
    ADD CONSTRAINT fk_smscommand_usergroup FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_sqlview_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sqlview
    ADD CONSTRAINT fk_sqlview_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_teattributedimension_attributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributedimension
    ADD CONSTRAINT fk_teattributedimension_attributeid FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_teattributedimension_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributedimension
    ADD CONSTRAINT fk_teattributedimension_legendsetid FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_tedataelementdimension_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentitydataelementdimension
    ADD CONSTRAINT fk_tedataelementdimension_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_tedataelementdimension_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentitydataelementdimension
    ADD CONSTRAINT fk_tedataelementdimension_legendsetid FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_teprogramindicatordimension_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityprogramindicatordimension
    ADD CONSTRAINT fk_teprogramindicatordimension_legendsetid FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_teprogramindicatordimension_programindicatorid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityprogramindicatordimension
    ADD CONSTRAINT fk_teprogramindicatordimension_programindicatorid FOREIGN KEY (programindicatorid) REFERENCES programindicator(programindicatorid);


--
-- Name: fk_trackedentityattribute_attributegroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT fk_trackedentityattribute_attributegroupid FOREIGN KEY (trackedentityattributegroupid) REFERENCES trackedentityattributegroup(trackedentityattributegroupid);


--
-- Name: fk_trackedentityattribute_legendset; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT fk_trackedentityattribute_legendset FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_trackedentityattribute_optionsetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT fk_trackedentityattribute_optionsetid FOREIGN KEY (optionsetid) REFERENCES optionset(optionsetid);


--
-- Name: fk_trackedentityattribute_trackedentityattributeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY smscodes
    ADD CONSTRAINT fk_trackedentityattribute_trackedentityattributeid FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_trackedentityattribute_trackedentityid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT fk_trackedentityattribute_trackedentityid FOREIGN KEY (trackedentityid) REFERENCES trackedentity(trackedentityid);


--
-- Name: fk_trackedentityattribute_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT fk_trackedentityattribute_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_trackedentityinstance_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityinstance
    ADD CONSTRAINT fk_trackedentityinstance_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_trackedentityinstance_representativeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityinstance
    ADD CONSTRAINT fk_trackedentityinstance_representativeid FOREIGN KEY (representativeid) REFERENCES trackedentityinstance(trackedentityinstanceid);


--
-- Name: fk_trackedentityinstance_trackedentityid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityinstance
    ADD CONSTRAINT fk_trackedentityinstance_trackedentityid FOREIGN KEY (trackedentityid) REFERENCES trackedentity(trackedentityid);


--
-- Name: fk_user_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_user_userid FOREIGN KEY (creatoruserid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_user_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_user_userinfoid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_userapps_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userapps
    ADD CONSTRAINT fk_userapps_userinfoid FOREIGN KEY (userinfoid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_userdatavieworgunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userdatavieworgunits
    ADD CONSTRAINT fk_userdatavieworgunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_userdatavieworgunits_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userdatavieworgunits
    ADD CONSTRAINT fk_userdatavieworgunits_userinfoid FOREIGN KEY (userinfoid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_usergroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergroup
    ADD CONSTRAINT fk_usergroup_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_usergroupaccess_usergroup; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergroupaccess
    ADD CONSTRAINT fk_usergroupaccess_usergroup FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_usergroupmanaging_managedbygroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergroupmanaged
    ADD CONSTRAINT fk_usergroupmanaging_managedbygroupid FOREIGN KEY (managedbygroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_usergroupmanaging_managedgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergroupmanaged
    ADD CONSTRAINT fk_usergroupmanaging_managedgroupid FOREIGN KEY (managedgroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_usergroupmembers_usergroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergroupmembers
    ADD CONSTRAINT fk_usergroupmembers_usergroupid FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_usergroupmembers_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergroupmembers
    ADD CONSTRAINT fk_usergroupmembers_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_userinfo_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usermembership
    ADD CONSTRAINT fk_userinfo_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_userkeyjsonvalue_user; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userkeyjsonvalue
    ADD CONSTRAINT fk_userkeyjsonvalue_user FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_usermembership_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usermembership
    ADD CONSTRAINT fk_usermembership_userinfoid FOREIGN KEY (userinfoid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_usermessage_user; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usermessage
    ADD CONSTRAINT fk_usermessage_user FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_userrole_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userrole
    ADD CONSTRAINT fk_userrole_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_userroleauthorities_userroleid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userroleauthorities
    ADD CONSTRAINT fk_userroleauthorities_userroleid FOREIGN KEY (userroleid) REFERENCES userrole(userroleid);


--
-- Name: fk_userroledataset_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userroledataset
    ADD CONSTRAINT fk_userroledataset_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_userroledataset_userroleid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userroledataset
    ADD CONSTRAINT fk_userroledataset_userroleid FOREIGN KEY (userroleid) REFERENCES userrole(userroleid);


--
-- Name: fk_userrolemembers_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userrolemembers
    ADD CONSTRAINT fk_userrolemembers_userid FOREIGN KEY (userid) REFERENCES users(userid);


--
-- Name: fk_userrolemembers_userroleid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userrolemembers
    ADD CONSTRAINT fk_userrolemembers_userroleid FOREIGN KEY (userroleid) REFERENCES userrole(userroleid);


--
-- Name: fk_userroleprogram_programid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY program_userroles
    ADD CONSTRAINT fk_userroleprogram_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_users_catconstraints_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY users_catdimensionconstraints
    ADD CONSTRAINT fk_users_catconstraints_userid FOREIGN KEY (userid) REFERENCES users(userid);


--
-- Name: fk_users_cogsconstraints_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY users_cogsdimensionconstraints
    ADD CONSTRAINT fk_users_cogsconstraints_userid FOREIGN KEY (userid) REFERENCES users(userid);


--
-- Name: fk_usersetting_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usersetting
    ADD CONSTRAINT fk_usersetting_userinfoid FOREIGN KEY (userinfoid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_userteisearchorgunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userteisearchorgunits
    ADD CONSTRAINT fk_userteisearchorgunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_userteisearchorgunits_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userteisearchorgunits
    ADD CONSTRAINT fk_userteisearchorgunits_userinfoid FOREIGN KEY (userinfoid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_validationrule_leftexpressionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrule
    ADD CONSTRAINT fk_validationrule_leftexpressionid FOREIGN KEY (leftexpressionid) REFERENCES expression(expressionid);


--
-- Name: fk_validationrule_periodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY predictor
    ADD CONSTRAINT fk_validationrule_periodtypeid FOREIGN KEY (periodtypeid) REFERENCES periodtype(periodtypeid);


--
-- Name: fk_validationrule_periodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrule
    ADD CONSTRAINT fk_validationrule_periodtypeid FOREIGN KEY (periodtypeid) REFERENCES periodtype(periodtypeid);


--
-- Name: fk_validationrule_rightexpressionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrule
    ADD CONSTRAINT fk_validationrule_rightexpressionid FOREIGN KEY (rightexpressionid) REFERENCES expression(expressionid);


--
-- Name: fk_validationrule_skiptestexpressionid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY predictor
    ADD CONSTRAINT fk_validationrule_skiptestexpressionid FOREIGN KEY (skiptestexpressionid) REFERENCES expression(expressionid);


--
-- Name: fk_validationrulegroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrulegroup
    ADD CONSTRAINT fk_validationrulegroup_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_validationrulegroup_validationruleid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrulegroupmembers
    ADD CONSTRAINT fk_validationrulegroup_validationruleid FOREIGN KEY (validationruleid) REFERENCES validationrule(validationruleid);


--
-- Name: fk_validationrulegroupmembers_validationrulegroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrulegroupmembers
    ADD CONSTRAINT fk_validationrulegroupmembers_validationrulegroupid FOREIGN KEY (validationgroupid) REFERENCES validationrulegroup(validationrulegroupid);


--
-- Name: fk_validationrulegroupusergroupstoalert_usergroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrulegroupusergroupstoalert
    ADD CONSTRAINT fk_validationrulegroupusergroupstoalert_usergroupid FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_validationrulegroupusergroupstoalert_validationgroupid; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrulegroupusergroupstoalert
    ADD CONSTRAINT fk_validationrulegroupusergroupstoalert_validationgroupid FOREIGN KEY (validationgroupid) REFERENCES validationrulegroup(validationrulegroupid);


--
-- Name: fka4dwo79bmu0cjtqeqgclj4d42; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY constantattributevalues
    ADD CONSTRAINT fka4dwo79bmu0cjtqeqgclj4d42 FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fka5vwhm9044o3r2mlf7wmkvoka; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupsetusergroupaccesses
    ADD CONSTRAINT fka5vwhm9044o3r2mlf7wmkvoka FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkamp4mkfqkkmhhmgjygkmtjpip; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupusergroupaccesses
    ADD CONSTRAINT fkamp4mkfqkkmhhmgjygkmtjpip FOREIGN KEY (categoryoptiongroupid) REFERENCES categoryoptiongroup(categoryoptiongroupid);


--
-- Name: fkapnobox9g47rnrrf9wtjkaevy; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY documenttranslations
    ADD CONSTRAINT fkapnobox9g47rnrrf9wtjkaevy FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkaux0ab565allf4ria7i4yqe9o; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategoryusergroupaccesses
    ADD CONSTRAINT fkaux0ab565allf4ria7i4yqe9o FOREIGN KEY (categoryid) REFERENCES dataelementcategory(categoryid);


--
-- Name: fkavox4jvxrnakb535jj5vo759s; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgrouptranslations
    ADD CONSTRAINT fkavox4jvxrnakb535jj5vo759s FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkb3i0kpxkt0oyh0pori98xj6f; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sqlviewusergroupaccesses
    ADD CONSTRAINT fkb3i0kpxkt0oyh0pori98xj6f FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkb8c0sfajb4r29mb76o4o59850; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributeattributevalues
    ADD CONSTRAINT fkb8c0sfajb4r29mb76o4o59850 FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fkbcijpkvi3rcx4nupghfqtpds3; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptioncombotranslations
    ADD CONSTRAINT fkbcijpkvi3rcx4nupghfqtpds3 FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkbmhr9ethpu50qckrga381i6cy; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementattributevalues
    ADD CONSTRAINT fkbmhr9ethpu50qckrga381i6cy FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fkbp9e1cf4kup4bfwa53kqhmhpe; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttabletranslations
    ADD CONSTRAINT fkbp9e1cf4kup4bfwa53kqhmhpe FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkbqtw7paqqiuor7kenyjjjkiwv; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY documentusergroupaccesses
    ADD CONSTRAINT fkbqtw7paqqiuor7kenyjjjkiwv FOREIGN KEY (documentid) REFERENCES document(documentid);


--
-- Name: fkbvcollq94hbv2kkjvbjhbklxi; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategoryoptionusergroupaccesses
    ADD CONSTRAINT fkbvcollq94hbv2kkjvbjhbklxi FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkbve6kfglt0ik8f9a3yw45hwnj; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrulegrouptranslations
    ADD CONSTRAINT fkbve6kfglt0ik8f9a3yw45hwnj FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkbyaw75hj8du8w14hpuhxj762w; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programmessage_emailaddresses
    ADD CONSTRAINT fkbyaw75hj8du8w14hpuhxj762w FOREIGN KEY (programmessageemailaddressid) REFERENCES programmessage(id);


--
-- Name: fkc466epp3jve9b0lpavgxocse4; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboardtranslations
    ADD CONSTRAINT fkc466epp3jve9b0lpavgxocse4 FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkc5hdg6ruv7glmp88j6ohkvxgu; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetusergroupaccesses
    ADD CONSTRAINT fkc5hdg6ruv7glmp88j6ohkvxgu FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkc5w6s58ykqw8gf6h8oxinq1p1; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupsetusergroupaccesses
    ADD CONSTRAINT fkc5w6s58ykqw8gf6h8oxinq1p1 FOREIGN KEY (categoryoptiongroupsetid) REFERENCES categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: fkc6ae9oxts83ohrx20gxjoo2o4; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptioncomboattributevalues
    ADD CONSTRAINT fkc6ae9oxts83ohrx20gxjoo2o4 FOREIGN KEY (categoryoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fkc6ibwny8jp0hq6l6w0w2untt4; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY smscommandcodes
    ADD CONSTRAINT fkc6ibwny8jp0hq6l6w0w2untt4 FOREIGN KEY (id) REFERENCES smscommands(smscommandid);


--
-- Name: fkccl4gw7l7hxrfgqa2hqnvxlkq; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovallevelusergroupaccesses
    ADD CONSTRAINT fkccl4gw7l7hxrfgqa2hqnvxlkq FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkcco3y9joqwitwh2mdrq2svakg; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupsetusergroupaccesses
    ADD CONSTRAINT fkcco3y9joqwitwh2mdrq2svakg FOREIGN KEY (dataelementgroupsetid) REFERENCES dataelementgroupset(dataelementgroupsetid);


--
-- Name: fkcd7hsom4yeetyooplbn496t76; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationruletranslations
    ADD CONSTRAINT fkcd7hsom4yeetyooplbn496t76 FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkch98ncn24f71dft102f7of537; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY smscommandspecialcharacters
    ADD CONSTRAINT fkch98ncn24f71dft102f7of537 FOREIGN KEY (smscommandid) REFERENCES smscommands(smscommandid);


--
-- Name: fkci0bfpwjo9komus48g0w5vo6r; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitleveltranslations
    ADD CONSTRAINT fkci0bfpwjo9komus48g0w5vo6r FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkcmnb6cbqwkgn6yl4ojsfapy4t; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategorytranslations
    ADD CONSTRAINT fkcmnb6cbqwkgn6yl4ojsfapy4t FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkcoo6svgtx8pre5fabnjuyhgpf; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY organisationunitattributevalues
    ADD CONSTRAINT fkcoo6svgtx8pre5fabnjuyhgpf FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkct4xt8suitanok5n57422l8sg; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY nationalunitusergroupaccesses
    ADD CONSTRAINT fkct4xt8suitanok5n57422l8sg FOREIGN KEY (nationalunitid) REFERENCES jphes_nationalunit(nationalunitid);


--
-- Name: fkd2mtpc764r2ylnyork25n2ffb; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagedataelement
    ADD CONSTRAINT fkd2mtpc764r2ylnyork25n2ffb FOREIGN KEY (programstagesectionid) REFERENCES programstagesection(programstagesectionid);


--
-- Name: fkd8f9hmgonr1f04lom1pwg2td5; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY documentusergroupaccesses
    ADD CONSTRAINT fkd8f9hmgonr1f04lom1pwg2td5 FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkdawo044shd3vyrgeqhlbp83h; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY colortranslations
    ADD CONSTRAINT fkdawo044shd3vyrgeqhlbp83h FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkdb0p44e9kub3gakn0bn39v47e; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorycombotranslations
    ADD CONSTRAINT fkdb0p44e9kub3gakn0bn39v47e FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkdba2e0q8kva3oiigmfjujmc09; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorattributevalues
    ADD CONSTRAINT fkdba2e0q8kva3oiigmfjujmc09 FOREIGN KEY (indicatorid) REFERENCES indicator(indicatorid);


--
-- Name: fkdc4xtxb8tk28tg8gihya0f8t3; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovalworkflowusergroupaccesses
    ADD CONSTRAINT fkdc4xtxb8tk28tg8gihya0f8t3 FOREIGN KEY (workflowid) REFERENCES dataapprovalworkflow(workflowid);


--
-- Name: fkdfoid1s8be97lj4d0dq0wn2h9; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementusergroupaccesses
    ADD CONSTRAINT fkdfoid1s8be97lj4d0dq0wn2h9 FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fkdmc46bnsqath7p6mrsrb89eml; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstageinstance_messageconversation
    ADD CONSTRAINT fkdmc46bnsqath7p6mrsrb89eml FOREIGN KEY (messageconversationid) REFERENCES messageconversation(messageconversationid);


--
-- Name: fkdsqsh7ab8t4k1y1taugooxcxl; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributevalues
    ADD CONSTRAINT fkdsqsh7ab8t4k1y1taugooxcxl FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkdudfflo1n7r4iuyqxba1b4ovi; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategoryoptionusergroupaccesses
    ADD CONSTRAINT fkdudfflo1n7r4iuyqxba1b4ovi FOREIGN KEY (categoryoptionid) REFERENCES dataelementcategoryoption(categoryoptionid);


--
-- Name: fkdx9fhldp5xt6quko76j4d8kk; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionsetusergroupaccesses
    ADD CONSTRAINT fkdx9fhldp5xt6quko76j4d8kk FOREIGN KEY (optionsetid) REFERENCES optionset(optionsetid);


--
-- Name: fke1eymlpayuhawlo8pfuwue654; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY smscommandcodes
    ADD CONSTRAINT fke1eymlpayuhawlo8pfuwue654 FOREIGN KEY (codeid) REFERENCES smscodes(smscodeid);


--
-- Name: fke2q9lkr609pqg1b0ydm0rowtm; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorgroupattributevalues
    ADD CONSTRAINT fke2q9lkr609pqg1b0ydm0rowtm FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fke9a9ot5uw06v8xysffntqn163; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttableusergroupaccesses
    ADD CONSTRAINT fke9a9ot5uw06v8xysffntqn163 FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fked5eqnav9x47sjkth9qop336u; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY agencyunitusergroupaccesses
    ADD CONSTRAINT fked5eqnav9x47sjkth9qop336u FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkehrkml89lh7kv1bmutotucsjm; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorgroupusergroupaccesses
    ADD CONSTRAINT fkehrkml89lh7kv1bmutotucsjm FOREIGN KEY (programindicatorgroupid) REFERENCES programindicatorgroup(programindicatorgroupid);


--
-- Name: fker1uvlubbi174wihftcmjqwah; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorgrouptranslations
    ADD CONSTRAINT fker1uvlubbi174wihftcmjqwah FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkeuett3yqyqms2edpep4g1etjd; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reportusergroupaccesses
    ADD CONSTRAINT fkeuett3yqyqms2edpep4g1etjd FOREIGN KEY (reportid) REFERENCES report(reportid);


--
-- Name: fkf97c7k1pwvp39tdx1ehrwywxp; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY externalmaplayerusergroupaccesses
    ADD CONSTRAINT fkf97c7k1pwvp39tdx1ehrwywxp FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkfamquh0yxd74tj2thpnxll8qd; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionsetusergroupaccesses
    ADD CONSTRAINT fkfamquh0yxd74tj2thpnxll8qd FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkfju7l9tdk4vuit5y3mw3pmfdp; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetusergroupaccesses
    ADD CONSTRAINT fkfju7l9tdk4vuit5y3mw3pmfdp FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fkfysoq9tcj6k0g942tni0p91sn; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupsettranslations
    ADD CONSTRAINT fkfysoq9tcj6k0g942tni0p91sn FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkgf3l6blh1evu8cbbfdel3dap; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiontranslations
    ADD CONSTRAINT fkgf3l6blh1evu8cbbfdel3dap FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkgfqmwaemr83enkhghft4v7hf6; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY nationalunitusergroupaccesses
    ADD CONSTRAINT fkgfqmwaemr83enkhghft4v7hf6 FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkgq38c88dd0nqfrxbdlxj95gkn; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboarditemtranslations
    ADD CONSTRAINT fkgq38c88dd0nqfrxbdlxj95gkn FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkgvdx3u8ymbvq3mfr0qih7kbgl; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptioncomboattributevalues
    ADD CONSTRAINT fkgvdx3u8ymbvq3mfr0qih7kbgl FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkh063grx17s8wbufgi6rmb2qj9; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementattributevalues
    ADD CONSTRAINT fkh063grx17s8wbufgi6rmb2qj9 FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkh31nsfige8jnsrulqraxuxo68; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY agencyunitusergroupaccesses
    ADD CONSTRAINT fkh31nsfige8jnsrulqraxuxo68 FOREIGN KEY (agencyunitid) REFERENCES jphes_agencyunit(agencyunitid);


--
-- Name: fkh7rgh9ccjygftu2um7bt8o15w; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionsetattributevalues
    ADD CONSTRAINT fkh7rgh9ccjygftu2um7bt8o15w FOREIGN KEY (optionsetid) REFERENCES optionset(optionsetid);


--
-- Name: fkh8a8f65qyvb9ht8218fbqif3r; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userroleusergroupaccesses
    ADD CONSTRAINT fkh8a8f65qyvb9ht8218fbqif3r FOREIGN KEY (userroleid) REFERENCES userrole(userroleid);


--
-- Name: fkhcb8xpki59p7up71arpcj6mgo; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categorycombousergroupaccesses
    ADD CONSTRAINT fkhcb8xpki59p7up71arpcj6mgo FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkhdb5bwj85vxienykc71k0h6gb; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionvaluetranslations
    ADD CONSTRAINT fkhdb5bwj85vxienykc71k0h6gb FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkhlhawnoj4iw21if6whyjhyuxx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreportusergroupaccesses
    ADD CONSTRAINT fkhlhawnoj4iw21if6whyjhyuxx FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fki0jsa3ibpqnmf9f6a079yvqg1; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionattributevalues
    ADD CONSTRAINT fki0jsa3ibpqnmf9f6a079yvqg1 FOREIGN KEY (optionvalueid) REFERENCES optionvalue(optionvalueid);


--
-- Name: fkibpy72i2p9nfkdtqqe6my34nr; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY pushanalysis
    ADD CONSTRAINT fkibpy72i2p9nfkdtqqe6my34nr FOREIGN KEY (dashboard) REFERENCES dashboard(dashboardid);


--
-- Name: fkijpqu28mpafr0wbgu2p4qs2ys; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupattributevalues
    ADD CONSTRAINT fkijpqu28mpafr0wbgu2p4qs2ys FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkikavm35a9xngxxqnaonnmk7yw; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupattributevalues
    ADD CONSTRAINT fkikavm35a9xngxxqnaonnmk7yw FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkilna5etu4xlgyf93sguvt6e6s; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorattributevalues
    ADD CONSTRAINT fkilna5etu4xlgyf93sguvt6e6s FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkisircfmtwyf4f63ci19fi4i8l; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupsetattributevalues
    ADD CONSTRAINT fkisircfmtwyf4f63ci19fi4i8l FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkj0jbavb81trhft9c1srk4m4an; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mechanismunitusergroupaccesses
    ADD CONSTRAINT fkj0jbavb81trhft9c1srk4m4an FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkj16b2115543s4odxcl034keuj; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY documentattributevalues
    ADD CONSTRAINT fkj16b2115543s4odxcl034keuj FOREIGN KEY (documentid) REFERENCES document(documentid);


--
-- Name: fkj3dr5vrqclcaodu7x4rm1qsbo; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programinstance_messageconversation
    ADD CONSTRAINT fkj3dr5vrqclcaodu7x4rm1qsbo FOREIGN KEY (programinstanceid) REFERENCES programinstance(programinstanceid);


--
-- Name: fkjmtfdehdm5kixd7fxidajbqpt; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupsettranslations
    ADD CONSTRAINT fkjmtfdehdm5kixd7fxidajbqpt FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkjp6o40q5mb5a9fixiaqxf6dur; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategoryoptionattributevalues
    ADD CONSTRAINT fkjp6o40q5mb5a9fixiaqxf6dur FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkjtpyr15khpfwyeljjblln3amh; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupattributevalues
    ADD CONSTRAINT fkjtpyr15khpfwyeljjblln3amh FOREIGN KEY (indicatorgroupid) REFERENCES indicatorgroup(indicatorgroupid);


--
-- Name: fkjuv8jwcqjrp9u60ca0b9secwe; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupsetusergroupaccesses
    ADD CONSTRAINT fkjuv8jwcqjrp9u60ca0b9secwe FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkjy8ap861np4x3c5glxv8l8719; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programinstance_messageconversation
    ADD CONSTRAINT fkjy8ap861np4x3c5glxv8l8719 FOREIGN KEY (messageconversationid) REFERENCES messageconversation(messageconversationid);


--
-- Name: fkk53fwmr0vsgh3pbfw1u5i7kxd; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorusergroupaccesses
    ADD CONSTRAINT fkk53fwmr0vsgh3pbfw1u5i7kxd FOREIGN KEY (indicatorid) REFERENCES indicator(indicatorid);


--
-- Name: fkkca6l1aa5y714267lpm03f6k1; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programusergroupaccesses
    ADD CONSTRAINT fkkca6l1aa5y714267lpm03f6k1 FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkkcioj9orjwbcwmdam6pj6d9o2; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorusergroupaccesses
    ADD CONSTRAINT fkkcioj9orjwbcwmdam6pj6d9o2 FOREIGN KEY (programindicatorid) REFERENCES programindicator(programindicatorid);


--
-- Name: fkkgab7upiou1pws7oempk5t367; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programtranslations
    ADD CONSTRAINT fkkgab7upiou1pws7oempk5t367 FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkknm2jjnfl49hvsruohsfapo3r; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupsettranslations
    ADD CONSTRAINT fkknm2jjnfl49hvsruohsfapo3r FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkkrhc4bbmf9jnaxj545a004fb; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optionsetattributevalues
    ADD CONSTRAINT fkkrhc4bbmf9jnaxj545a004fb FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkkrroom2rcrf3a83abq969085u; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chartusergroupaccesses
    ADD CONSTRAINT fkkrroom2rcrf3a83abq969085u FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fkks9i10v8xg7d22hlhmesia51l; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstageinstance_messageconversation
    ADD CONSTRAINT fkks9i10v8xg7d22hlhmesia51l FOREIGN KEY (programstageinstanceid) REFERENCES programstageinstance(programstageinstanceid);


--
-- Name: fkktmkxjuo5b3v1q2jqk7lymh0p; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY outbound_sms_recipients
    ADD CONSTRAINT fkktmkxjuo5b3v1q2jqk7lymh0p FOREIGN KEY (outbound_sms_id) REFERENCES outbound_sms(id);


--
-- Name: fkkyhyiwi48ogtjvtvltk506eeh; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reportusergroupaccesses
    ADD CONSTRAINT fkkyhyiwi48ogtjvtvltk506eeh FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkl0xk38e01qsghc0kkbykbbodo; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupsetusergroupaccesses
    ADD CONSTRAINT fkl0xk38e01qsghc0kkbykbbodo FOREIGN KEY (orgunitgroupsetid) REFERENCES orgunitgroupset(orgunitgroupsetid);


--
-- Name: fkl8cxqyb3s8c31qbaqehu71u9e; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY constantusergroupaccesses
    ADD CONSTRAINT fkl8cxqyb3s8c31qbaqehu71u9e FOREIGN KEY (constantid) REFERENCES constant(constantid);


--
-- Name: fklbmw2ijdfkxonj516i8nqcoe; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributevalues
    ADD CONSTRAINT fklbmw2ijdfkxonj516i8nqcoe FOREIGN KEY (trackedentityid) REFERENCES trackedentity(trackedentityid);


--
-- Name: fklcvyf20urcrk3k1grq17u5yxa; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programindicatorusergroupaccesses
    ADD CONSTRAINT fklcvyf20urcrk3k1grq17u5yxa FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkleuiq3mib4iq5q840n80cv993; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY documentattributevalues
    ADD CONSTRAINT fkleuiq3mib4iq5q840n80cv993 FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkljaoalw4iomchlahjcmijy41n; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementusergroupaccesses
    ADD CONSTRAINT fkljaoalw4iomchlahjcmijy41n FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkljv6vp4ro5l6stx7dclnkenen; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programmessage_deliverychannels
    ADD CONSTRAINT fkljv6vp4ro5l6stx7dclnkenen FOREIGN KEY (programmessagedeliverychannelsid) REFERENCES programmessage(id);


--
-- Name: fklllvhilfsouycft98q82ph66q; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY pushanalysisrecipientusergroups
    ADD CONSTRAINT fklllvhilfsouycft98q82ph66q FOREIGN KEY (usergroupid) REFERENCES pushanalysis(pushanalysisid);


--
-- Name: fklp3x88u96384c9cnjqic8hf4w; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programdataelementtranslations
    ADD CONSTRAINT fklp3x88u96384c9cnjqic8hf4w FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fklq73q1u6q1w6uilvg8xjvqpkq; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreportusergroupaccesses
    ADD CONSTRAINT fklq73q1u6q1w6uilvg8xjvqpkq FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkly81qo12mmdwo1nuxqvdvw07d; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstageattributevalues
    ADD CONSTRAINT fkly81qo12mmdwo1nuxqvdvw07d FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkm5h5tkbbogqelay0io9qm74o0; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventchartusergroupaccesses
    ADD CONSTRAINT fkm5h5tkbbogqelay0io9qm74o0 FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkmfeihksbnauk0swgve0o96ewr; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY interpretationusergroupaccesses
    ADD CONSTRAINT fkmfeihksbnauk0swgve0o96ewr FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkmmdfsq1s9g437k0wsshbivaht; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY externalmaplayerusergroupaccesses
    ADD CONSTRAINT fkmmdfsq1s9g437k0wsshbivaht FOREIGN KEY (externalmaplayerid) REFERENCES externalmaplayer(externalmaplayerid);


--
-- Name: fkmrqgrjgwtns2j3w5wvp2cil0f; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgrouptranslations
    ADD CONSTRAINT fkmrqgrjgwtns2j3w5wvp2cil0f FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkmrvj9l6sv7su7wehohc9wipdu; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboardusergroupaccesses
    ADD CONSTRAINT fkmrvj9l6sv7su7wehohc9wipdu FOREIGN KEY (dashboardid) REFERENCES dashboard(dashboardid);


--
-- Name: fkmumx7i7wqjn3jh4mt4r4x1eqe; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongroupsetusergroupaccesses
    ADD CONSTRAINT fkmumx7i7wqjn3jh4mt4r4x1eqe FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkmw5yn4ptnpkve2lsvxiopdp6; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dashboardusergroupaccesses
    ADD CONSTRAINT fkmw5yn4ptnpkve2lsvxiopdp6 FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkmwadbe8twmr8ordbjjlrloxnp; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userroleusergroupaccesses
    ADD CONSTRAINT fkmwadbe8twmr8ordbjjlrloxnp FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkmxrvdw7rdmo0o50qjbk30lw8f; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventreporttranslations
    ADD CONSTRAINT fkmxrvdw7rdmo0o50qjbk30lw8f FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkn2afpli3opeouwqvtguobc7td; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY reporttranslations
    ADD CONSTRAINT fkn2afpli3opeouwqvtguobc7td FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkn5mp5cao30al69clovpwwe6mk; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupsetusergroupaccesses
    ADD CONSTRAINT fkn5mp5cao30al69clovpwwe6mk FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkn8cff8o99v6tnpgl2fgugjwpf; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergroupusergroupaccesses
    ADD CONSTRAINT fkn8cff8o99v6tnpgl2fgugjwpf FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fkndy19mcicdsxoq15p0fd7p1ew; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupsettranslations
    ADD CONSTRAINT fkndy19mcicdsxoq15p0fd7p1ew FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkne0hjh5lknlabbotmbpm9ynwx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupusergroupaccesses
    ADD CONSTRAINT fkne0hjh5lknlabbotmbpm9ynwx FOREIGN KEY (optiongroupid) REFERENCES optiongroup(optiongroupid);


--
-- Name: fknfwv4dnc90au8jvtt3ra2scbl; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupusergroupaccesses
    ADD CONSTRAINT fknfwv4dnc90au8jvtt3ra2scbl FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fknimjjjq6ww7vcnjbxw9qo3daa; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupusergroupaccesses
    ADD CONSTRAINT fknimjjjq6ww7vcnjbxw9qo3daa FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fknqghxxgrlh1dyluj9fgh1x6pn; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributeusergroupaccesses
    ADD CONSTRAINT fknqghxxgrlh1dyluj9fgh1x6pn FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fknthmdh7yci1po66i02ssldxod; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY legendsetattributevalues
    ADD CONSTRAINT fknthmdh7yci1po66i02ssldxod FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fko74ok1o1jcw9b9byfp2c995lu; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributetranslations
    ADD CONSTRAINT fko74ok1o1jcw9b9byfp2c995lu FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fko975uxx8n7sspdysehujj8e7t; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapusergroupaccesses
    ADD CONSTRAINT fko975uxx8n7sspdysehujj8e7t FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkoccxpdljjjbxr1vrwfp9d25dt; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sqlviewusergroupaccesses
    ADD CONSTRAINT fkoccxpdljjjbxr1vrwfp9d25dt FOREIGN KEY (sqlviewid) REFERENCES sqlview(sqlviewid);


--
-- Name: fkokgalu75pd2e1no2x53cxe8ik; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapusergroupaccesses
    ADD CONSTRAINT fkokgalu75pd2e1no2x53cxe8ik FOREIGN KEY (mapid) REFERENCES map(mapid);


--
-- Name: fkopw1b57inx5x5sm7r22lh0qso; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programstagetranslations
    ADD CONSTRAINT fkopw1b57inx5x5sm7r22lh0qso FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkou5go53l80o7omb2dqcpp7wjh; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chartusergroupaccesses
    ADD CONSTRAINT fkou5go53l80o7omb2dqcpp7wjh FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkp7of94t57djd0buqsc46xs32u; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupattributevalues
    ADD CONSTRAINT fkp7of94t57djd0buqsc46xs32u FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fkp7u6oqpln4dt83wovshmrc1jo; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programruletranslations
    ADD CONSTRAINT fkp7u6oqpln4dt83wovshmrc1jo FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkp8i8mavj9jd5q2lyqag2rhi03; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupattributevalues
    ADD CONSTRAINT fkp8i8mavj9jd5q2lyqag2rhi03 FOREIGN KEY (dataelementgroupid) REFERENCES dataelementgroup(dataelementgroupid);


--
-- Name: fkprt8bw5cw4fvcnpfe9iayng1v; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY attributetranslations
    ADD CONSTRAINT fkprt8bw5cw4fvcnpfe9iayng1v FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkq6f4o8i51dngmiimuj3wctes3; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userattributevalues
    ADD CONSTRAINT fkq6f4o8i51dngmiimuj3wctes3 FOREIGN KEY (userinfoid) REFERENCES userinfo(userinfoid);


--
-- Name: fkq80dj8d4slnw9lna5jrsdxxou; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupsetusergroupaccesses
    ADD CONSTRAINT fkq80dj8d4slnw9lna5jrsdxxou FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkqgvpllqqqfstetxiuikf4my7q; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY categoryoptiongrouptranslations
    ADD CONSTRAINT fkqgvpllqqqfstetxiuikf4my7q FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkqky1rnn3ulqpc6j0mpjrm7elm; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergroupusergroupaccesses
    ADD CONSTRAINT fkqky1rnn3ulqpc6j0mpjrm7elm FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkqramkdhx87vxn8oybmygjbu1a; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationcriteriatranslations
    ADD CONSTRAINT fkqramkdhx87vxn8oybmygjbu1a FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkqsfp938c3hscdt0l85kakwtxr; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY datasetattributevalues
    ADD CONSTRAINT fkqsfp938c3hscdt0l85kakwtxr FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkqv5w8d50v5bhcsvwahlwfslqu; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY constantusergroupaccesses
    ADD CONSTRAINT fkqv5w8d50v5bhcsvwahlwfslqu FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkrbtkonmtsb3dd6fri8jh4kcgx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY colorsettranslations
    ADD CONSTRAINT fkrbtkonmtsb3dd6fri8jh4kcgx FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkrq69i1s0tkmw9u0mga5eggoyx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataapprovalleveltranslations
    ADD CONSTRAINT fkrq69i1s0tkmw9u0mga5eggoyx FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fks04qh58fxmsf5601n9cvpdtc8; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY chart_filters
    ADD CONSTRAINT fks04qh58fxmsf5601n9cvpdtc8 FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fks1k3a2f1c1isq1ujtwwqwfonx; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorusergroupaccesses
    ADD CONSTRAINT fks1k3a2f1c1isq1ujtwwqwfonx FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fks24flr8pd794omx6xusmkeboe; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupusergroupaccesses
    ADD CONSTRAINT fks24flr8pd794omx6xusmkeboe FOREIGN KEY (dataelementgroupid) REFERENCES dataelementgroup(dataelementgroupid);


--
-- Name: fks2olf101iiehl4ekaw0ytbmpg; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementgroupattributevalues
    ADD CONSTRAINT fks2olf101iiehl4ekaw0ytbmpg FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fks2timamyiijrioyi2nd5ysxjc; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY userattributevalues
    ADD CONSTRAINT fks2timamyiijrioyi2nd5ysxjc FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fks3en52yvnu8nfdbcbsqdealwu; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sectionattributevalues
    ADD CONSTRAINT fks3en52yvnu8nfdbcbsqdealwu FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fks5roynmoahk5mqu1j019ym7; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY sectionattributevalues
    ADD CONSTRAINT fks5roynmoahk5mqu1j019ym7 FOREIGN KEY (sectionid) REFERENCES section(sectionid);


--
-- Name: fks6crbtws3n0g2os9894uyb0c4; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY validationrulegroupusergroupaccesses
    ADD CONSTRAINT fks6crbtws3n0g2os9894uyb0c4 FOREIGN KEY (validationrulegroupid) REFERENCES validationrulegroup(validationrulegroupid);


--
-- Name: fksfctbv0m7p1qyf32jisp4u031; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY eventcharttranslations
    ADD CONSTRAINT fksfctbv0m7p1qyf32jisp4u031 FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fksii4ij2x35tx3f9u7a76k78jl; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY maplegendtranslations
    ADD CONSTRAINT fksii4ij2x35tx3f9u7a76k78jl FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fksmifkdbg5bgp66c2yl203lqrn; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongroupattributevalues
    ADD CONSTRAINT fksmifkdbg5bgp66c2yl203lqrn FOREIGN KEY (optiongroupid) REFERENCES optiongroup(optiongroupid);


--
-- Name: fksn12ea6xcfweyp0bob6tssdcg; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY orgunitgroupusergroupaccesses
    ADD CONSTRAINT fksn12ea6xcfweyp0bob6tssdcg FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkt27tftlhawo7tq1t1embuwc5e; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY mapviewtranslations
    ADD CONSTRAINT fkt27tftlhawo7tq1t1embuwc5e FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkt66m7wsp2phes81tx37l4sn4b; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatorgroupsetusergroupaccesses
    ADD CONSTRAINT fkt66m7wsp2phes81tx37l4sn4b FOREIGN KEY (indicatorgroupsetid) REFERENCES indicatorgroupset(indicatorgroupsetid);


--
-- Name: fkt7cgg1phqdlubtcwekr6jd785; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY legendsetattributevalues
    ADD CONSTRAINT fkt7cgg1phqdlubtcwekr6jd785 FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fktl0s6blarqvbvjhnoa94drtb2; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY smscommandspecialcharacters
    ADD CONSTRAINT fktl0s6blarqvbvjhnoa94drtb2 FOREIGN KEY (specialcharacterid) REFERENCES smsspecialcharacter(specialcharacterid);


--
-- Name: fktl5384fpv5fdjv4ke8e34ul6e; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY optiongrouptranslations
    ADD CONSTRAINT fktl5384fpv5fdjv4ke8e34ul6e FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fktlnn6e4dj457rtlgf8gaangnq; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY usergroupattributevalues
    ADD CONSTRAINT fktlnn6e4dj457rtlgf8gaangnq FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fktokd1a55e5b1vetrjv1ka84av; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY dataelementcategoryoptionattributevalues
    ADD CONSTRAINT fktokd1a55e5b1vetrjv1ka84av FOREIGN KEY (categoryoptionid) REFERENCES dataelementcategoryoption(categoryoptionid);


--
-- Name: fktpgxscfqt74wu7v11cyrgxc9e; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY trackedentityattributegrouptranslations
    ADD CONSTRAINT fktpgxscfqt74wu7v11cyrgxc9e FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fku1h7cukhyye5ejgjbs0kaye0; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY programusergroupaccesses
    ADD CONSTRAINT fku1h7cukhyye5ejgjbs0kaye0 FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fku37f3oirygw2xn7gqgo6rnq9; Type: FK CONSTRAINT; Schema: public; Owner: dhis
--

ALTER TABLE ONLY indicatortranslations
    ADD CONSTRAINT fku37f3oirygw2xn7gqgo6rnq9 FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

