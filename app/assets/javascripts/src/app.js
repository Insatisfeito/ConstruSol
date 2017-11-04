var app = function() {

  $(function() {
    navToggleRight();
    navToggleLeft();
    navToggleSub();
    profileToggle();
    calculateResults();
    buildDataTables();




  });


  var buildDataTables = function() {
    $("#panel1link").click(function() {
      $("#construsolution_type").val(0);
    });
    $("#panel2link").click(function() {
      $("#construsolution_type").val(1);
    });
    $(".chosen-select").chosen({ no_results_text: "Sem resultados! ", allow_duplicates: true });
    $(".chosen-select-compare").chosen({ no_results_text: "Sem resultados! ", allow_duplicates: false, max_selected_options: 3 });
    var dataTable = $('#example');
    if (dataTable.length == 0) {} else { $('#example').dataTable(); }
  }

  var calculateResults = function() {
    var adp = $('[id^="adp"]');
    var gwp = $('[id^="gwp"]');
    var odp = $('[id^="odp"]');
    var ap = $('[id^="ap"]');
    var popc = $('[id^="popc"]');
    var ep = $('[id^="ep"]');
    var enr = $('[id^="enr"]');
    var er = $('[id^="er"]');
    var costC = $('[id^="costC"]');
    var costM = $('[id^="costM"]');
    var u = $('[id^="u"]');
    var adps = { "max": 0, "min": 0, idMax: [], idMin: [] };
    var gwps = { "max": 0, "min": 0, idMax: null, idMin: null };
    var odps = { "max": 0, "min": 0, idMax: null, idMin: null };
    var aps = { "max": 0, "min": 0, idMax: null, idMin: null };
    var popcs = { "max": 0, "min": 0, idMax: null, idMin: null };
    var eps = { "max": 0, "min": 0, idMax: null, idMin: null };
    var enrs = { "max": 0, "min": 0, idMax: null, idMin: null };
    var ers = { "max": 0, "min": 0, idMax: null, idMin: null };
    var costsC = { "max": 0, "min": 0, idMax: null, idMin: null };
    var costsM = { "max": 0, "min": 0, idMax: null, idMin: null };
    var us = { "max": 0, "min": 0, idMax: null, idMin: null };
    for (var i = 0; i < adp.length; i++) {
      var value = Number(adp[i].textContent)
      if (i === 0) {
        adps.max = value;
        adps.min = value;
        adps.idMax = [adp[i].id];
        adps.idMin = [adp[i].id];
      }
      if (adps.max < value) {
        console.log('max ' + adps.max + ' ' + value)
        adps.max = value;
        adps.idMax = [adp[i].id];
      }
      if (adps.min > value) {
        console.log('min ' + adps.min + ' ' + value)
        adps.min = value;
        adps.idMin = [adp[i].id];
      }

      if (adps.min === value) {
        adps.idMin.push(adp[i].id);
      }
      if (adps.max === value) {
        adps.idMax.push(adp[i].id);
      }
    }
    adps.idMax.forEach(function(element) {
      $('#' + element).css("background-color", "red")
      $('#' + element).css("color", "white")
    });
    adps.idMin.forEach(function(element) {
      $('#' + element).css("background-color", "green")
      $('#' + element).css("color", "white")
    });



    for (var i = 0; i < gwp.length; i++) {
      var value = Number(gwp[i].textContent)
      if (i === 0) {
        gwps.max = value;
        gwps.min = value;
        gwps.idMax = [gwp[i].id];
        gwps.idMin = [gwp[i].id];
      }
      if (gwps.max < value) {
        console.log('max ' + gwps.max + ' ' + value)
        gwps.max = value;
        gwps.idMax = [gwp[i].id];
      }
      if (gwps.min > value) {
        console.log('min ' + gwps.min + ' ' + value)
        gwps.min = value;
        gwps.idMin = [gwp[i].id];
      }

      if (gwps.min === value) {
        gwps.idMin.push(gwp[i].id);
      }
      if (gwps.max === value) {
        gwps.idMax.push(gwp[i].id);
      }
    }
    gwps.idMax.forEach(function(element) {
      $('#' + element).css("background-color", "red")
      $('#' + element).css("color", "white")
    });
    gwps.idMin.forEach(function(element) {
      $('#' + element).css("background-color", "green")
      $('#' + element).css("color", "white")
    });



    for (var i = 0; i < odp.length; i++) {
      var value = Number(odp[i].textContent)
      if (i === 0) {
        odps.max = value;
        odps.min = value;
        odps.idMax = [odp[i].id];
        odps.idMin = [odp[i].id];
      }
      if (odps.max < value) {
        console.log('max ' + odps.max + ' ' + value)
        odps.max = value;
        odps.idMax = [odp[i].id];
      }
      if (odps.min > value) {
        console.log('min ' + odps.min + ' ' + value)
        odps.min = value;
        odps.idMin = [odp[i].id];
      }

      if (odps.min === value) {
        odps.idMin.push(odp[i].id);
      }
      if (odps.max === value) {
        odps.idMax.push(odp[i].id);
      }
    }
    odps.idMax.forEach(function(element) {
      $('#' + element).css("background-color", "red")
      $('#' + element).css("color", "white")
    });
    odps.idMin.forEach(function(element) {
      $('#' + element).css("background-color", "green")
      $('#' + element).css("color", "white")
    });



    for (var i = 0; i < ap.length; i++) {
      var value = Number(ap[i].textContent)
      if (i === 0) {
        aps.max = value;
        aps.min = value;
        aps.idMax = [ap[i].id];
        aps.idMin = [ap[i].id];
      }
      if (aps.max < value) {
        console.log('max ' + aps.max + ' ' + value)
        aps.max = value;
        aps.idMax = [ap[i].id];
      }
      if (aps.min > value) {
        console.log('min ' + aps.min + ' ' + value)
        aps.min = value;
        aps.idMin = [ap[i].id];
      }

      if (aps.min === value) {
        aps.idMin.push(ap[i].id);
      }
      if (aps.max === value) {
        aps.idMax.push(ap[i].id);
      }
    }
    aps.idMax.forEach(function(element) {
      $('#' + element).css("background-color", "red")
      $('#' + element).css("color", "white")
    });
    aps.idMin.forEach(function(element) {
      $('#' + element).css("background-color", "green")
      $('#' + element).css("color", "white")
    });

    for (var i = 0; i < popc.length; i++) {
      var value = Number(popc[i].textContent)
      if (i === 0) {
        popcs.max = value;
        popcs.min = value;
        popcs.idMax = [popc[i].id];
        popcs.idMin = [popc[i].id];
      }
      if (popcs.max < value) {
        console.log('max ' + popcs.max + ' ' + value)
        popcs.max = value;
        popcs.idMax = [popc[i].id];
      }
      if (popcs.min > value) {
        console.log('min ' + popcs.min + ' ' + value)
        popcs.min = value;
        popcs.idMin = [popc[i].id];
      }

      if (popcs.min === value) {
        popcs.idMin.push(popc[i].id);
      }
      if (popcs.max === value) {
        popcs.idMax.push(popc[i].id);
      }
    }
    popcs.idMax.forEach(function(element) {
      $('#' + element).css("background-color", "red")
      $('#' + element).css("color", "white")
    });
    popcs.idMin.forEach(function(element) {
      $('#' + element).css("background-color", "green")
      $('#' + element).css("color", "white")
    });


    for (var i = 0; i < ep.length; i++) {
      var value = Number(ep[i].textContent)
      if (i === 0) {
        eps.max = value;
        eps.min = value;
        eps.idMax = [ep[i].id];
        eps.idMin = [ep[i].id];
      }
      if (eps.max < value) {
        console.log('max ' + eps.max + ' ' + value)
        eps.max = value;
        eps.idMax = [ep[i].id];
      }
      if (eps.min > value) {
        console.log('min ' + eps.min + ' ' + value)
        eps.min = value;
        eps.idMin = [ep[i].id];
      }

      if (eps.min === value) {
        eps.idMin.push(ep[i].id);
      }
      if (eps.max === value) {
        eps.idMax.push(ep[i].id);
      }
    }
    eps.idMax.forEach(function(element) {
      $('#' + element).css("background-color", "red")
      $('#' + element).css("color", "white")
    });
    eps.idMin.forEach(function(element) {
      $('#' + element).css("background-color", "green")
      $('#' + element).css("color", "white")
    });


    for (var i = 0; i < enr.length; i++) {
      var value = Number(enr[i].textContent)
      if (i === 0) {
        enrs.max = value;
        enrs.min = value;
        enrs.idMax = [enr[i].id];
        enrs.idMin = [enr[i].id];
      }
      if (enrs.max < value) {
        console.log('max ' + enrs.max + ' ' + value)
        enrs.max = value;
        enrs.idMax = [enr[i].id];
      }
      if (enrs.min > value) {
        console.log('min ' + enrs.min + ' ' + value)
        enrs.min = value;
        enrs.idMin = [enr[i].id];
      }

      if (enrs.min === value) {
        enrs.idMin.push(enr[i].id);
      }
      if (enrs.max === value) {
        enrs.idMax.push(enr[i].id);
      }
    }
    enrs.idMax.forEach(function(element) {
      $('#' + element).css("background-color", "red")
      $('#' + element).css("color", "white")
    });
    enrs.idMin.forEach(function(element) {
      $('#' + element).css("background-color", "green")
      $('#' + element).css("color", "white")
    });


    for (var i = 0; i < er.length; i++) {
      var value = Number(er[i].textContent)
      if (i === 0) {
        ers.max = value;
        ers.min = value;
        ers.idMax = [er[i].id];
        ers.idMin = [er[i].id];
      }
      if (ers.max < value) {
        console.log('max ' + ers.max + ' ' + value)
        ers.max = value;
        ers.idMax = [er[i].id];
      }
      if (ers.min > value) {
        console.log('min ' + ers.min + ' ' + value)
        ers.min = value;
        ers.idMin = [er[i].id];
      }

      if (ers.min === value) {
        ers.idMin.push(er[i].id);
      }
      if (ers.max === value) {
        ers.idMax.push(er[i].id);
      }
    }
    ers.idMax.forEach(function(element) {
      $('#' + element).css("background-color", "red")
      $('#' + element).css("color", "white")
    });
    ers.idMin.forEach(function(element) {
      $('#' + element).css("background-color", "green")
      $('#' + element).css("color", "white")
    });



    for (var i = 0; i < costC.length; i++) {
      var value = Number(costC[i].textContent)
      if (i === 0) {
        costsC.max = value;
        costsC.min = value;
        costsC.idMax = [costC[i].id];
        costsC.idMin = [costC[i].id];
      }
      if (costsC.max < value) {
        console.log('max ' + costsC.max + ' ' + value)
        costsC.max = value;
        costsC.idMax = [costC[i].id];
      }
      if (costsC.min > value) {
        console.log('min ' + costsC.min + ' ' + value)
        costsC.min = value;
        costsC.idMin = [costC[i].id];
      }

      if (costsC.min === value) {
        costsC.idMin.push(costC[i].id);
      }
      if (costsC.max === value) {
        costsC.idMax.push(costC[i].id);
      }
    }
    costsC.idMax.forEach(function(element) {
      $('#' + element).css("background-color", "red")
      $('#' + element).css("color", "white")
    });
    costsC.idMin.forEach(function(element) {
      $('#' + element).css("background-color", "green")
      $('#' + element).css("color", "white")
    });

    for (var i = 0; i < costM.length; i++) {
      var value = Number(costM[i].textContent)
      if (i === 0) {
        costsM.max = value;
        costsM.min = value;
        costsM.idMax = [costM[i].id];
        costsM.idMin = [costM[i].id];
      }
      if (costsM.max < value) {
        console.log('max ' + costsM.max + ' ' + value)
        costsM.max = value;
        costsM.idMax = [costM[i].id];
      }
      if (costsM.min > value) {
        console.log('min ' + costsM.min + ' ' + value)
        costsM.min = value;
        costsM.idMin = [costM[i].id];
      }

      if (costsM.min === value) {
        costsM.idMin.push(costM[i].id);
      }
      if (costsM.max === value) {
        costsM.idMax.push(costM[i].id);
      }
    }
    costsM.idMax.forEach(function(element) {
      $('#' + element).css("background-color", "red")
      $('#' + element).css("color", "white")
    });
    costsM.idMin.forEach(function(element) {
      $('#' + element).css("background-color", "green")
      $('#' + element).css("color", "white")
    });


    for (var i = 0; i < u.length; i++) {
      var value = Number(u[i].textContent)
      if (i === 0) {
        us.max = value;
        us.min = value;
        us.idMax = [u[i].id];
        us.idMin = [u[i].id];
      }
      if (us.max < value) {
        console.log('max ' + us.max + ' ' + value)
        us.max = value;
        us.idMax = [u[i].id];
      }
      if (us.min > value) {
        console.log('min ' + us.min + ' ' + value)
        us.min = value;
        us.idMin = [u[i].id];
      }

      if (us.min === value) {
        us.idMin.push(u[i].id);
      }
      if (us.max === value) {
        us.idMax.push(u[i].id);
      }
    }
    us.idMax.forEach(function(element) {
      $('#' + element).css("background-color", "red")
      $('#' + element).css("color", "white")
    });
    us.idMin.forEach(function(element) {
      $('#' + element).css("background-color", "green")
      $('#' + element).css("color", "white")
    });



  };




  var navToggleRight = function() {
    $('#toggle-right').on('click', function() {
      $('#sidebar-right').toggleClass('sidebar-right-open');
      $("#toggle-right .fa").toggleClass("fa-indent fa-dedent");

    });
  };



  var navToggleLeft = function() {
    $('#toggle-left').on('click', function() {
      var bodyEl = $('#main-wrapper');
      ($(window).width() > 767) ? $(bodyEl).toggleClass('sidebar-mini'): $(bodyEl).toggleClass('sidebar-opened');
    });
  };

  var navToggleSub = function() {
    var subMenu = $('.sidebar .nav');
    $(subMenu).navgoco({
      caretHtml: false,
      accordion: true
    });

  };

  var profileToggle = function() {
    $('#toggle-profile').click(function() {
      $('.sidebar-profile').slideToggle();
    });
  };


  //return functions
  return {

  };
}();
