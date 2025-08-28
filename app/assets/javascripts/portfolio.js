document.addEventListener("DOMContentLoaded", () => {
  const sortableGrid = document.querySelector(".sortable");

  if (sortableGrid) {
    // Initialize html5sortable
    sortable(sortableGrid, {
      items: ".portfolio-item",
      forcePlaceholderSize: true,
      placeholderClass: "sortable-placeholder"
    });

    console.log("✅ Portfolio drag-and-drop enabled!");

    // When items are reordered
    sortableGrid.addEventListener("sortupdate", () => {
      const order = [];
      document.querySelectorAll(".portfolio-item").forEach((el, index) => {
        order.push({  
          id: el.dataset.id,
          position: index + 1
        });
      });

      console.log("📦 Sending order to server:", order);

      // Send AJAX request to Rails
      fetch("/portfolios/sort", {
        method: "POST", // we used POST in routes.rb
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
        },
        body: JSON.stringify({ order: order.map(o => o.id) })
      })
        .then(response => {
          if (response.ok) {
            console.log("✅ Order saved successfully!");
          } else {
            console.error("❌ Failed to save order:", response.statusText);
          }
        })
        .catch(error => console.error("❌ AJAX error:", error));
    });
  }
});
