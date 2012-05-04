function test_bug1450

% TEST test_bug1450
% TEST ft_checkconfig

global ft_default
ft_default = [];
ft_default.field1 = 1;
ft_default.field2 = 2;
ft_default.field3 = 3;
ft_default.sub.field1 = 1;
ft_default.sub.field2 = 2;
ft_default.sub.field3 = 3;
ft_default.sub.sub.field1 = 1;
ft_default.sub.sub.field2 = 2;
ft_default.sub.sub.field3 = 3;
ft_default.sub.sub.sub.field1 = 1;
ft_default.sub.sub.sub.field2 = 2;
ft_default.sub.sub.sub.field3 = 3;

cfg = [];
cfg = ft_checkconfig(cfg);
assert(isequal(cfg, ft_default));

cfg = [];
cfg.field1 = 1;
cfg = ft_checkconfig(cfg);
% field1 should remain as it is, field 2 and 3 should have been added
assert(isequal(cfg, ft_default));

cfg = [];
cfg.sub = [];
cfg = ft_checkconfig(cfg);
% the subfields should have been added
assert(isequal(cfg, ft_default));

cfg = [];
cfg.sub.field1 = 1;
cfg = ft_checkconfig(cfg);
% the sub-fields 2 and 3 should have been added, sub-field 1 should remain as it is
assert(isequal(cfg, ft_default));

cfg = [];
cfg.sub.sub.field1 = 1;
cfg = ft_checkconfig(cfg);
% do the same test, but now two levels deep
assert(isequal(cfg, ft_default));

cfg = [];
cfg.sub.sub.sub.field1 = 1;
cfg = ft_checkconfig(cfg);
% do the same test, but now three levels deep
assert(isequal(cfg, ft_default));