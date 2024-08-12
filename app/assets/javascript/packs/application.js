import Quagga from 'quagga';
document.addEventListener('DOMContentLoaded', () => {
  if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
    Quagga.init({
      inputStream: {
        name: "Live",
        type: "LiveStream",
        target: document.querySelector('#scanner-container') // Set the container for the video stream
      },
      decoder: {
        readers: ["upc_reader"] // Specify the barcode types you want to scan
      }
    }, function(err) {
      if (err) {
        console.error(err);
        return;
      }
      Quagga.start();
    });

    Quagga.onDetected(data => {
      console.log(data.codeResult.code); // This is the UPC code

      // Optionally send the UPC code to your Rails backend
      fetch('/barcode_scan', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        body: JSON.stringify({ upc: data.codeResult.code })
      });
    });
  }
});
