classdef IDModel
    properties
        a_max
        b_max
        v_0
        T
        h_0
        delta
        L
    end
    methods
        function obj = IDModel(consts)
            obj.a_max = consts.a_max; 
            obj.b_max = consts.b_max;
            obj.v_0 = consts.v_0;
            obj.T = consts.T;
            obj.h_0 = consts.h_0;
            obj.delta = consts.delta;
            obj.L = consts.L;
        end
        function dy = nextStep(obj, ~, y, x_l, v_l)
            h_star = obj.h_0 + y(2) * obj.T  + (y(2) * (y(2) - v_l)) / (2 * sqrt(obj.a_max * obj.b_max));
            h = x_l - y(1) - obj.L;
            dy = [
                y(2);
                obj.a_max * (1 - (y(2) / obj.v_0)^obj.delta - (h_star / h)^2)
                ];
        end
    end
end