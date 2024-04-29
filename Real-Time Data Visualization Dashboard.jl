using Genie
using VegaLite

# Define a Genie app
app = Genie()

# Define an endpoint to serve the dashboard HTML page
route("/", method=GET) do
    return """
    <html>
    <head>
        <title>Real-Time Data Visualization Dashboard</title>
        <script src="https://cdn.jsdelivr.net/npm/vega@5"></script>
        <script src="https://cdn.jsdelivr.net/npm/vega-lite@5"></script>
        <script src="https://cdn.jsdelivr.net/npm/vega-embed@6"></script>
    </head>
    <body>
        <div id="vis"></div>
        <script>
            // Define WebSocket connection
            var socket = new WebSocket("ws://localhost:8000/ws");

            // Initialize Vega-Lite visualization
            var visSpec = {
                "$schema": "https://vega.github.io/schema/vega-lite/v5.json",
                "data": {"values": []},
                "mark": "bar",
                "encoding": {
                    "x": {"field": "x", "type": "ordinal"},
                    "y": {"field": "y", "type": "quantitative"}
                }
            };
            vegaEmbed("#vis", visSpec);

            // Update visualization on WebSocket message
            socket.onmessage = function(event) {
                var data = JSON.parse(event.data);
                vegaEmbed("#vis", visSpec, {"actions": false, "data": {"values": data}});
            };
        </script>
    </body>
    </html>
    """
end

# Define a WebSocket route to push real-time data updates
route("/ws", method=GET) do
    socket = WebSocket(handler)
    while isopen(socket)
        # Example: Generate and send random data updates every second
        data = [{x: "A", y: rand(10)}, {x: "B", y: rand(10)}, {x: "C", y: rand(10)}]
        push!(socket, JSON.json(data))
        sleep(1)
    end
end

# Start the Genie server
Genie.startup(app, async=true)
