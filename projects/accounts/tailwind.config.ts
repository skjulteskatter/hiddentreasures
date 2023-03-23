import type { Config } from "tailwindcss";
export default <Partial<Config>>{
    theme: {
        extend: {
            colors: {
                primary: "#BD9B60",
                secondary: "#213F47",
                success: "#44ae34",
                error: "#ba3f3f",
            },
        },
    },
};
